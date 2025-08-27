import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

import 'package:startick/data/remote/model/txn_dto.dart';
import 'package:startick/data/remote/repo/ticket_repo.dart';
import 'package:startick/ui/utils/base_class/view_model.dart';
import 'package:startick/ui/utils/toasts.dart';

class TicketScanModel extends ViewModel {
  PermissionStatus? _permissionStatus;
  QRViewController? controller;
  String? qrData;
  int _peopleCount = 0;
  String? ticketId;
  TxnDto? _txnDto;
  Timer? timer;
  String? _couponName, _discount;
  TicketStatus _ticketStatus = TicketStatus.scanning;

  TicketStatus get ticketStatus => _ticketStatus;

  PermissionStatus? get permissionStatus => _permissionStatus;

  int get peopleCount => _peopleCount;

  String? get couponName => _couponName;
  String? get discount => _discount;

  TxnDto? get txnDto => _txnDto;

  set peopleCount(int count) {
    _peopleCount = count;
    notifyListeners();
  }

  set couponName(String? value) {
    _couponName = value;
    notifyListeners();
  }

  set discount(String? value) {
    _discount = value;
    notifyListeners();
  }

  set permissionStatus(PermissionStatus? status) {
    _permissionStatus = status;
    notifyListeners();
  }

  set txnDto(TxnDto? value) {
    _txnDto = value;
    notifyListeners();
  }

  bool isCameraAccess(PermissionStatus? status) {
    if (status == null) {
      return false;
    } else if (status.isGranted || status.isLimited) {
      return true;
    } else {
      return false;
    }
  }

  set ticketStatus(TicketStatus value) {
    if (value == TicketStatus.scanning) {
      qrData = null;
      peopleCount = 0;
      ticketId = null;
      txnDto = null;
    }
    if (value == TicketStatus.scanned) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
    _ticketStatus = value;
    notifyListeners();
  }

  startStatus() {
    if (!(timer?.isActive ?? false)) {
      timer = Timer.periodic(const Duration(seconds: 1), (value) async {
        permissionStatus = await Permission.camera.status;
        if (permissionStatus!.isGranted || permissionStatus!.isLimited) {
          timer?.cancel();
        }
      });
    }
  }

  Future<void> checkPermission([bool force = false]) async {
    try {
      if (Platform.isAndroid) {
        permissionStatus = await Permission.camera.request();
        if (force && permissionStatus!.isPermanentlyDenied) {
          final result = await openAppSettings();
          if (result) {
            startStatus();
          }
        } else if (force && permissionStatus!.isDenied) {
          errorToast("Camera Can't Be Access");
        }
      } else {
        permissionStatus = PermissionStatus.granted;
      }
    } catch (_) {
      errorToast(ViewModel.genericErrorMessage);
    }
  }

  void updateQr(String? data) async {
    if (qrData == null && data != null) {
      callApi(() async {
        Uri uri = Uri.parse(data);
        ticketId = uri.queryParameters["session_id"];
        qrData = data;
        ticketStatus = TicketStatus.scanned;
        isLoading = false;
        final responseDto = await TicketRepo.getTicketData(ticketId!);
        if (responseDto.isSuccessful) {
          txnDto = responseDto.data?.firstOrNull;
          ticketStatus = TicketStatus.details;
        } else {
          ticketStatus = TicketStatus.failed;
        }
      }, (msg) {
        ticketStatus = TicketStatus.failed;
      });
    }
  }

  void updateQrCoupon(String? data) async {
    if (qrData == null && data != null) {
      callApi(() async {
        qrData = data;
        isLoading = false;
        final responseDto = await TicketRepo.coupanScan(data);
        if (responseDto.isSuccessful) {
          discount = responseDto.data?.discount;
          couponName = responseDto.data?.name;
          ticketStatus = TicketStatus.checkout;
        } else {
          ticketStatus = TicketStatus.failed;
        }
      }, (msg) {
        ticketStatus = TicketStatus.failed;
      });
    }
  }

  void throughCoupon(String coupon) async {
    if (isLoading) return;
    callApi(() async {
      ticketId = coupon;
      isLoading = false;
      final responseDto = await TicketRepo.coupanScan(coupon);
      if (responseDto.isSuccessful) {
        discount = responseDto.data?.discount;
        couponName = responseDto.data?.name;
        ticketStatus = TicketStatus.checkout;
      } else {
        ticketStatus = TicketStatus.failed;
      }
    }, (msg) {
      ticketStatus = TicketStatus.failed;
    });
  }

  void updateCount() {
    if (ticketId == null || isLoading) return;
    if (peopleCount == 0) {
      onError?.call("Select Present Patrons First");
      return;
    }
    callApi(() async {
      final response = await TicketRepo.updateCount(peopleCount, ticketId!);
      if (response.isSuccessful) {
        ticketStatus = TicketStatus.checkout;
        successToast(response.message);
      } else {
        onError?.call(response.message);
      }
    });
  }

  Future<void> flashClick() async {
    if (controller == null) return;
    await controller!.toggleFlash();
  }
}

enum TicketStatus { scanning, scanned, details, select, failed, checkout }
