import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startick/data/remote/network_connection.dart';
import 'package:startick/ui/utils/toasts.dart';

///Base Class for encapsulating logic related to Loading Status management, and error handling
///Use of this class is helpful while using classes such as
///[LoadingIndicatorConsumer], [CommonButtonLoading], [ScreenBase]
///All of the above mentioned classes take generic parameters
class ViewModel extends ChangeNotifier {
  static const genericErrorMessage =
      "Something went wrong, Please try again later";
  bool _isLoading = false;

  set isLoading(value) {
    _isLoading = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  ///error message for showing in snackBar
  ValueChanged<String?>? onError;

  void _checkInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        onError?.call("Server Error. Try again latter");
      } else {
        onError?.call("Please Check Your Internet Connection");
      }
    } on SocketException catch (_) {
      onError?.call("Please Check Your Internet Connection");
    }
  }

  void callApi(AsyncCallback api, [ValueChanged<String>? catchError]) {
    if (NetworkConnection.isNetworkAvailable.value) {
      isLoading = true;
      api().then((_) {
        isLoading = false;
      }).catchError((th, stackTrace) {
        isLoading = false;
        String msg = '';
        if (th is SocketException) {
          _checkInternet();
        } else if (th is FormatException) {
          msg = "Format Exception Found. ${th.message}";
        } else if (th is HttpException) {
          msg = th.message;
        } else if (th is TimeoutException) {
          msg = "Server Error. Try again latter";
        } else {
          msg = genericErrorMessage;
        }
        if (catchError != null) {
          catchError.call(msg);
        } else {
          onError?.call(msg);
        }
        developer.log("Caught Error while calling api: $th");
        developer.log("Type of Exception: ${th.runtimeType}");
        developer.log('Stack Trace: $stackTrace');
      });
    } else {
      String msg = "Please Check Your Internet Connection";
      if (catchError != null) {
        catchError.call(msg);
      } else {
        onError?.call(msg);
      }
    }
  }

  ///subclasses should override this method.
  ///in order to reset the state of this ViewModel.
  void invalidate() {}
}

///should be used if we want to access viewModel inside initState method of a StateFul Widget.
void withViewModel<VIEW_MODEL extends ViewModel>(
  BuildContext context,
  void Function(VIEW_MODEL viewModel) function,
) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    final provider = Provider.of<VIEW_MODEL>(context, listen: false);
    function.call(provider);
  });
}
