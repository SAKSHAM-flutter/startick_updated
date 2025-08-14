import 'package:built_collection/built_collection.dart';
import 'package:startick/data/local/shared_pref.dart';
import 'package:startick/data/remote/endpoints.dart';
import 'package:startick/data/remote/model/coupan_history_dto.dart';
import 'package:startick/data/remote/model/response_dto.dart';
import 'package:startick/data/remote/networking.dart';

class MetherRepo {
  static Future<ResponseDto<BuiltList<CoupanHistoryDto>>>
      getCoupanHistory() async {
    final response = await httpPostList<CoupanHistoryDto>(
      Endpoints.scanHistory,
      {"id": Prefs.id.get(), "user_type": Prefs.userType.get()},
    );
    return response;
  }

  static Future<ResponseDto<BuiltList<CoupanHistoryDto>>>
      getCoupanData() async {
    final response = await httpPostList<CoupanHistoryDto>(
      Endpoints.scannerList,
      {"id": Prefs.id.get(), "user_type": Prefs.userType.get()},
    );
    return response;
  }
}
