import 'package:startick/data/remote/endpoints.dart';
import 'package:startick/data/remote/model/event_states_dto.dart';
import 'package:startick/data/remote/model/guest_dto.dart';
import 'package:startick/data/remote/model/in_out_dto.dart';
import 'package:startick/data/remote/model/response_dto.dart';
import 'package:startick/data/remote/networking.dart';
import 'package:startick/ui/utils/custom_extension.dart';

class EventRepo {
  static List<GuestDto> guests = [];

  static Future<List<GuestDto>> guestList(String eventId) async {
    final res =
        await httpPostList<GuestDto>(Endpoints.guestList, {"eventId": eventId});
    guests = res.data?.toList() ?? [];
    return res.data?.toList() ?? [];
  }

  static Future<ResponseDto<EventStatesDto?>> eventStatistics(
      DateTime dateTime, String eventId) async {
    final res = await httpPost<EventStatesDto>(Endpoints.eventStatistics,
        {"date": dateTime.toYYYYMMDD(), "eventId": eventId});
    return res;
  }

  static Future<ResponseDto<InOutDto?>> eventInOut(String eventId) async {
    final res =
        await httpPost<InOutDto>(Endpoints.inOUTCount, {"eventId": eventId});
    return res;
  }
}
