import 'dart:async';
import 'dart:developer';

import 'package:startick/data/remote/model/event_dto.dart';
import 'package:startick/data/remote/model/event_states_dto.dart';
import 'package:startick/data/remote/model/guest_dto.dart';
import 'package:startick/data/remote/model/in_out_dto.dart';
import 'package:startick/data/remote/repo/event_repo.dart';
import 'package:startick/ui/utils/base_class/view_model.dart';

class EventDetailModel extends ViewModel {
  DateTime _dateTime = DateTime.now();
  int _currentIndex = 0;
  int _guestOrder = 0;
  int _itemsShowed = 0;
  bool _statesLoad = false;
  Timer? timer;
  GuestMode _guestMode = GuestMode.same;
  bool _guestLoad = false;

  EventDto? _eventDto;
  List<GuestDto> _guest = [];
  List<GuestDto> _defaultGuest = [];

  InOutDto? _inOutDto;
  EventStatesDto? _eventStates;

  int get currentIndex => _currentIndex;

  int get itemsShowed => _itemsShowed;

  int get guestOrder => _guestOrder;

  DateTime get dateTime => _dateTime;

  GuestMode get guestMode => _guestMode;

  bool get statesLoad => _statesLoad;

  bool get guestLoad => _guestLoad;

  List<GuestDto> get guest => _guest;

  List<GuestDto> get defaultGuest => _defaultGuest;

  InOutDto? get inOutDto => _inOutDto;

  EventDto? get eventDto => _eventDto;

  EventStatesDto? get eventStates => _eventStates;

  set currentIndex(int value) {
    if (currentIndex != value) {
      itemsShowed = guest.length >= 100 ? 50 : guest.length;
      if (value == 0) {
        startUpdatingCount(guest.length);
      }
    }
    _currentIndex = value;
    notifyListeners();
  }

  set itemsShowed(int value) {
    _itemsShowed = value;
    notifyListeners();
  }

  set guestOrder(int value) {
    _guestOrder = value;
    notifyListeners();
  }

  set statesLoad(bool value) {
    _statesLoad = value;
    notifyListeners();
  }

  set guestMode(GuestMode value) {
    _guestMode = value;
    notifyListeners();
  }

  set guestLoad(bool value) {
    _guestLoad = value;
    notifyListeners();
  }

  set dateTime(DateTime value) {
    _dateTime = value;
    notifyListeners();
    getEventStates();
  }

  set eventDto(EventDto? value) {
    _eventDto = value;
    notifyListeners();
  }

  set guest(List<GuestDto> value) {
    _guest = value;
    notifyListeners();
  }

  set defaultGuest(List<GuestDto> value) {
    _defaultGuest = value;
    notifyListeners();
  }

  set inOutDto(InOutDto? value) {
    _inOutDto = value;
    notifyListeners();
  }

  set eventStates(EventStatesDto? value) {
    _eventStates = value;
    notifyListeners();
  }

  void onDateChanged(bool isNext) {
    if (isLoading) return;
    const duration = Duration(days: 1);
    if (isNext) {
      dateTime = dateTime.add(duration);
    } else {
      dateTime = dateTime.subtract(duration);
    }
  }

  void init() {
    getInOut();
    getEventStates();
    getEventGuest();
  }

  void getEventStates() {
    if (eventDto == null) return;
    callApi(() async {
      isLoading = false;
      statesLoad = true;
      final response = await EventRepo.eventStatistics(dateTime, eventDto!.id);
      statesLoad = false;
      if (response.isSuccessful) {
        eventStates = response.data;
      } else {
        eventStates = null;
      }
    }, (msg) {
      eventStates = null;
      statesLoad = false;
    });
  }

  void startUpdatingCount(int total) {
    if (guest.isEmpty) return;
    itemsShowed = total >= 100 ? 50 : total;
    if (itemsShowed != total) {
      timer = Timer.periodic(const Duration(microseconds: 5), (value) {
        if (itemsShowed != total) {
          int afterAdd = itemsShowed + 100;
          if (afterAdd < total) {
            itemsShowed = afterAdd;
          } else {
            timer?.cancel();
            itemsShowed = total;
          }
        }
      });
    }
  }

  void changeGuestMode([GuestMode? mode]) {
    if (mode != null) {
      guestMode = mode;
      if (guestMode == GuestMode.inOrder) {
        List<GuestDto> inGuest = [];
        List<GuestDto> outGuest = [];
        guest.map((e) {
          if (e.status == 'in') {
            inGuest.add(e);
          } else {
            outGuest.add(e);
          }
        }).toList();
        guest = [...inGuest, ...outGuest];
      } else if (guestMode == GuestMode.out) {
        List<GuestDto> inGuest = [];
        List<GuestDto> outGuest = [];
        guest.map((e) {
          if (e.status == 'in') {
            inGuest.add(e);
          } else {
            outGuest.add(e);
          }
        }).toList();
        guest = [...outGuest, ...inGuest];
      }
    } else if (guestMode == GuestMode.same) {
      guestMode = GuestMode.asc;
      guest.sort((a, b) => a.aTOZ(b));
    } else if (guestMode == GuestMode.asc) {
      guestMode = GuestMode.desc;
      guest.sort((a, b) => a.zTOA(b));
    } else if (guestMode == GuestMode.desc) {
      guestMode = GuestMode.same;
    } else {
      guestMode = GuestMode.same;
    }
  }

  void getEventGuest() {
    if (eventDto == null) return;
    callApi(() async {
      guestLoad = true;
      isLoading = false;
      guest = await EventRepo.guestList(eventDto!.id);
      defaultGuest = EventRepo.guests;
      startUpdatingCount(guest.length);
      guestLoad = false;
    }, (s) {
      guestLoad = false;
    });
  }

  void changeOrder() {
    if (guestOrder == 0) {
      guest.sort((a, b) => a.aTOZ(b));
      guestOrder = 1;
    } else if (guestOrder == 1) {
      guest.sort((a, b) => a.zTOA(b));
      guestOrder = 2;
    } else if (guestOrder == 2) {
      guestOrder = 0;
    }
  }

  void getInOut() {
    if (eventDto == null) return;
    callApi(() async {
      isLoading = false;
      final response = await EventRepo.eventInOut(eventDto!.id);
      if (response.isSuccessful) {
        inOutDto = response.data;
      }
    });
  }
}

enum GuestMode { same, asc, desc, inOrder, out }
