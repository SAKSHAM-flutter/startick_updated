import 'package:startick/data/remote/model/coupan_history_dto.dart';
import 'package:startick/data/remote/repo/mether_repo.dart';
import 'package:startick/ui/utils/base_class/view_model.dart';
import 'package:startick/ui/utils/toasts.dart';

class SCHomeModel extends ViewModel {
  int _current = 0;

  int get current => _current;

  set current(int value) {
    _current = value;
    notifyListeners();
  }

  List<CoupanHistoryDto>? _coupons;

  List<CoupanHistoryDto>? get coupons => _coupons;

  set coupons(List<CoupanHistoryDto>? value) {
    _coupons = value;
    notifyListeners();
  }

  void getCoupanHistory() {
    if (isLoading) return;
    callApi(() async {
      final response = await MetherRepo.getCoupanHistory();
      if (response.isSuccessful) {
        coupons = response.data?.toList() ?? [];
      } else {
        errorToast(response.message);
      }
    });
  }

  void getCoupanList() {
    if (isLoading) return;
    callApi(() async {
      final response = await MetherRepo.getCoupanData();
      if (response.isSuccessful) {
        coupons = response.data?.toList() ?? [];
      } else {
        errorToast(response.message);
      }
    });
  }

  // void scanCoupon() {
  //   if (isLoading) return;
  //   callApi(() async {
  //     final response = await MetherRepo.coupanScan();
  //     if (response.isSuccessful) {
  //     } else {
  //       errorToast(response.message);
  //     }
  //   });
  // }
}
