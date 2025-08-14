import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startick/data/remote/model/login_dto.dart';
import 'package:startick/data/remote/model/response_dto.dart';
import 'package:startick/data/remote/repo/auth_repo.dart';
import 'package:startick/ui/utils/base_class/view_model.dart';
import 'package:startick/ui/utils/custom_extension.dart';
import 'package:startick/ui/utils/toasts.dart';
import 'package:startick/ui/utils/validations/common_validations.dart';

class AuthViewModel extends ViewModel with CommonValidations {
  ValueChanged<ResponseDto>? onLogin;
  VoidCallback? onOtpSuccess;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  FocusNode passFocus = FocusNode(), emailFocus = FocusNode();
  FocusNode otpFocus = FocusNode();
  bool _obSecure = true;
  String _user = "Organiser";
  List<String> types = ["Organiser", "Scanner"];

  bool get obSecure => _obSecure;

  String get user => _user;

  set obSecure(bool value) {
    _obSecure = value;
    notifyListeners();
  }

  set user(String value) {
    _user = value;
    notifyListeners();
    credentialSet();
  }

  void onFocusNext(FocusNode value) {
    if (emailFocus.hasFocus) {
      emailFocus.unfocus();
      passFocus.requestFocus();

      notifyListeners();
    } else if (passFocus.hasFocus) {
      passFocus.unfocus();
      notifyListeners();
    }
  }

  void unFocus() {
    passFocus.unfocus();
    emailFocus.unfocus();
    notifyListeners();
  }

  void changeVisible() {
    obSecure = !obSecure;
    notifyListeners();
  }

  void credentialSet() {
    if (_user == "Organiser") {
      // emailController.text = "babbug@ticketmania.com.au";
      // passwordController.text = "babbug@123";
    } else {
      // emailController.text = "desirocks4@startickets.au";
      // passwordController.text = "desirocks4@123";
    }
  }

  void onFocusTap(FocusNode value) {
    if (value == emailFocus && passFocus.hasFocus) {
      passFocus.unfocus();
      value.requestFocus();
      notifyListeners();
    } else if (value == passFocus && emailFocus.hasFocus) {
      emailFocus.unfocus();
      value.requestFocus();
      notifyListeners();
    } else {
      value.requestFocus();
      notifyListeners();
    }
  }

  void login() {
    if (isLoading) return;
    unFocus();
    String? emailError = isValidEmail(emailController.text);
    // String? passError = isEnteredField("Password", passwordController.text);
    // String? emailError = isEnteredField("Email", emailController.text);
    // String? typeError = user.isNullOrEmpty() ? "Please Select User Type" : null;
    if (!(emailError).isNullOrEmpty()) {
      onError?.call(emailError);
      return;
    }
    callApi(() async {
      ResponseDto<LoginDto?> responseDto = await AuthRepo.login(
        // user!,
        emailController.text.trim(),
        // passwordController.text,
      );
      if (responseDto.isSuccessful) {
        onLogin?.call(responseDto);
        successToast(responseDto.message);
      } else {
        onError?.call(responseDto.message);
      }
    });
  }

  void forgot() {
    if (isLoading) return;
    unFocus();
    String? emailError = isValidEmail(emailController.text);
    // String? emailError = isEnteredField("Email", emailController.text);
    String? typeError = user.isNullOrEmpty() ? "Please Select User Type" : null;
    if (!(typeError ?? emailError).isNullOrEmpty()) {
      onError?.call(typeError ?? emailError);
      return;
    }
    // callApi(() async {
    //   ResponseDto<LoginDto?> responseDto = await AuthRepo.login(
    //     user!,
    //     emailController.text.trim(),
    //     passwordController.text,
    //   );
    //   if (responseDto.isSuccessful) {
    //     onLogin?.call(user!);
    //     successToast(responseDto.message);
    //   } else {
    //     onError?.call(responseDto.message);
    //   }
    // });
  }

  void clearCache() {
    emailController.clear();
    passwordController.clear();
  }

  void otpVerification() {
    if (isLoading) return;
    unFocus();
    String? otpError = isValidCode(otpController.text);
    if (!otpError.isNullOrEmpty()) {
      onError?.call(otpError);
      return;
    }
    callApi(() async {
      final responseDto = await AuthRepo.otpVerify(otpController.text.trim());
      if (responseDto.isSuccessful) {
        onOtpSuccess?.call();
        successToast(responseDto.message);
      } else {
        // onOtpSuccess?.call();
        onError?.call(responseDto.message);
      }
    });
  }

  void resendOTP() {
    if (isLoading) return;
    unFocus();
    callApi(() async {
      otpController.clear();
      final responseDto = await AuthRepo.resendOtp();
      if (responseDto.isSuccessful) {
        successToast(responseDto.message);
      } else {
        onError?.call(responseDto.message);
      }
    });
  }
}
