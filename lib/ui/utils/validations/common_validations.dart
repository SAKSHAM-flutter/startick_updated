import 'package:startick/ui/utils/custom_extension.dart';
import 'package:startick/ui/utils/validations/constant_message.dart';

mixin CommonValidations {
  String? isValidPassword(String? password) {
    RegExp rex = RegExp(r"^[a-z]{6}$");
    if (password.isNullOrEmpty()) {
      return ValidationConstant.blankPassword;
    } else if (password!.trim().length < ValidationConstant.passwordMinLength &&
        !rex.hasMatch(password)) {
      return ValidationConstant.passwordRegExInvalid;
    } else {
      return null;
    }
  }

  String? isPasswordAndConfirmValid(String? password, String? confirmPassword) {
    if (confirmPassword.isNullOrEmpty()) {
      return ValidationConstant.blankConfirmPassword;
    } else if (confirmPassword != password) {
      return ValidationConstant.passwordNotMatched;
    } else {
      return null;
    }
  }

  String? isOldPasswordAndNewValid(String? password, String? newPassword) {
    if (newPassword == password) {
      return "Old password and New password can't be same";
    } else {
      return null;
    }
  }

  String? isValidEmail(String? email) {
    if (email.isNullOrEmpty()) {
      return ValidationConstant.blankEmail;
    }
    final isValid = ValidationConstant.emailValidRegEx.hasMatch(email!.trim());
    if (isValid) {
      return null;
    } else {
      return ValidationConstant.invalidMail;
    }
  }

  String? isValidMobile(String? value) {
    if (value.isNullOrEmpty()) {
      return ValidationConstant.blankMobile;
    } else if (value!.trim().length < ValidationConstant.mobileMinLength ||
        value.trim().length > ValidationConstant.mobileMaxLength) {
      return ValidationConstant.blankMobile;
    } else {
      return null;
    }
  }

  String? isValidCode(String? value) {
    if (value.isNullOrEmpty()) {
      return ValidationConstant.blankVerificationCode;
    } else if (value!.trim().length != ValidationConstant.otpLength) {
      return ValidationConstant.verificationCodeLength;
    } else {
      return null;
    }
  }

  String? isRequiredField(String field, String? value) {
    if (value.isNullOrEmpty()) {
      return '$field is Required';
    } else {
      return null;
    }
  }

  String? isEnteredField(String field, String? value) {
    if (value.isNullOrEmpty()) {
      return 'Please enter $field';
    } else {
      return null;
    }
  }

  String? isSelectedField(String field, String? value) {
    if (value.isNullOrEmpty()) {
      return 'Please select $field';
    } else {
      return null;
    }
  }
}
