import 'package:startick/data/remote/endpoints.dart';
import 'package:startick/data/remote/model/banner_dto.dart';
import 'package:startick/data/remote/model/event_dto.dart';
import 'package:startick/data/remote/networking.dart';

class HomeRepo {
  static Future<List<EventDto>> getEvents() async {
    final response = await httpGetListPart<EventDto>(Endpoints.getAllEvent, {});
    return response.data?.toList() ?? [];
  }

  static Future<List<BannerDto>> getBanners() async {
    final response = await httpGetList<BannerDto>(Endpoints.banners, {});
    return response.data?.toList() ?? [];
  }
}
