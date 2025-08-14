class ValidationConstant {
  static RegExp emailInputRegEx = RegExp(r'^[A-Za-z0-9_.@]+$');
  static RegExp emailValidRegEx = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );
  static const int passwordMinLength = 6;
  static const int mobileMinLength = 5;
  static const int maxPassword = 16;
  static const int maxNames = 35;
  static const int maxZipCode = 6;
  static const int otpLength = 4;
  static const int mobileMaxLength = 15;
  static const int emailMaxLength = 50;

  static String withoutCredential = "Please enter Email and Password";
  static String blankEmail = "Please enter email";
  static String invalidMail = "Please enter Valid Email";
  static String blankMobile = "Please enter Valid Mobile";
  static String invalidMobile = "Please enter valid Mobile Number";
  static String blankUserName = "Please enter username";
  static String blankPassword = "Please enter password";
  static String blankConfirmPassword = "Please enter confirm password";
  static String passwordNotMatched = "Password didn't matched";
  static String signUpFieldsBlank = "Please fill all required fields";
  static String blankName = "Please enter name";
  static String blankVerificationCode = "Please enter Verification Code";
  static String verificationCodeLength =
      "Verification Code should be $otpLength digit";
  static String passwordRegExInvalid =
      'Password should be between $passwordMinLength to $maxPassword characters and should include 1 Uppercase, 1 Lowercase, 1 Number and 1 Special Character ';

  // static String blankName = "Please enter name";
  static String logOutTitle = 'Are you sure you want to Logout?';
}
