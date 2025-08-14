import 'package:startick/data/remote/model/banner_dto.dart';
import 'package:startick/data/remote/model/event_dto.dart';
import 'package:startick/data/remote/repo/home_repo.dart';
import 'package:startick/ui/utils/base_class/view_model.dart';
import 'package:startick/ui/utils/custom_extension.dart';
import 'package:startick/ui/utils/toasts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeViewModel extends ViewModel {
  bool _listView = true;
  bool _drawerShow = false;
  int _currentIndex = 0;
  int _bannerIndex = 0;
  List<EventDto> _events = [];
  List<BannerDto> _banners = [];

  int get currentIndex => _currentIndex;

  int get bannerIndex => _bannerIndex;

  List<EventDto> get events => _events;

  List<BannerDto> get banners => _banners;

  bool get listView => _listView;

  bool get drawerShow => _drawerShow;

  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  set events(List<EventDto> value) {
    _events = value;
    notifyListeners();
  }

  set banners(List<BannerDto> value) {
    _banners = value;
    notifyListeners();
  }

  set bannerIndex(int value) {
    _bannerIndex = value;
    notifyListeners();
  }

  set listView(bool value) {
    _listView = value;
    notifyListeners();
  }

  set drawerShow(bool value) {
    _drawerShow = value;
    notifyListeners();
  }

  void customEventAdd() {
    events = [
      EventDto(
        (e) => e
          ..id = "13"
          ..min = "20"
          ..name = "Saksham Event"
          ..image =
              "https://images.pexels.com/photos/2747449/pexels-photo-2747449.jpeg?cs=srgb&dl=pexels-wolfgang-1002140-2747449.jpg&fm=jpg"
          ..url =
              "https://images.pexels.com/photos/976866/pexels-photo-976866.jpeg?cs=srgb&dl=pexels-joshsorenson-976866.jpg&fm=jpg"
          ..address = "Near Home"
          ..availableSeat = "20"
          ..bookedSeat = "10"
          ..totalSeat = "30"
          ..eventTime = "10:30"
          ..date = "25-10-2025"
          ..vat = "12"
          ..vatType = "VatType",
      ),
      EventDto(
        (e) => e
          ..id = "12"
          ..min = "40"
          ..name = "Sajal Event"
          ..image =
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKF_YlFFlKS6AQ8no0Qs_xM6AkjvwFwP61og&s"
          ..url =
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKF_YlFFlKS6AQ8no0Qs_xM6AkjvwFwP61og&s"
          ..address = "Near My Ghr"
          ..availableSeat = "25"
          ..bookedSeat = "30"
          ..totalSeat = "55"
          ..eventTime = "12:30"
          ..date = "25-11-2025"
          ..vat = "13"
          ..vatType = "VatType",
      ),
    ];
  }

  void clickToLaunch(BannerDto bannerDto) {
    callApi(
      () async {
        if (!bannerDto.url.isNullOrEmpty()) {
          Uri? uri = Uri.tryParse(bannerDto.url!);
          if (uri != null) {
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
            }
          }
        }
      },
      (msg) => errorToast("No Action Found!"),
    );
  }

  void getEvents() {
    callApi(() async {
      events = await HomeRepo.getEvents();
      // customEventAdd();
    });
  }

  void getBanners() {
    callApi(() async {
      banners = await HomeRepo.getBanners();
    });
  }
}
