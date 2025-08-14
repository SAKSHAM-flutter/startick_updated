import 'package:built_collection/built_collection.dart';
import 'package:startick/data/local/shared_pref.dart';
import 'package:startick/data/remote/endpoints.dart';
import 'package:startick/data/remote/model/response_dto.dart';
import 'package:startick/data/remote/model/txn_dto.dart';
import 'package:startick/data/remote/model/unit_dto.dart';
import 'package:startick/data/remote/networking.dart';

class TicketRepo {
  static Future<ResponseDto<BuiltList<TxnDto>>> getTicketData(
      String txnId) async {
    final response =
        await httpPostList<TxnDto>(Endpoints.txnDetails, {"txn_id": txnId});
    return response;
  }

  static Future<ResponseDto<UnitDto?>> updateCount(
      int count, String ticketId) async {
    final response = await httpPost<UnitDto>(Endpoints.eventIN, {
      "txn_id": ticketId,
      "present_member_count": "$count",
    });
    return response;
  }

  static Future<ResponseDto<UnitDto?>> coupanScan(String couponName) async {
    final response = await httpPost<UnitDto>(
      Endpoints.scanResponse,
      {
        "user_id": int.parse(Prefs.id.get()),
        "user_type": Prefs.userType.get(),
        "coupon_name": couponName,
      },
    );
    return response;
  }
}
