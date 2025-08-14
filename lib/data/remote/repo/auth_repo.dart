import 'package:startick/data/local/shared_pref.dart';
import 'package:startick/data/remote/endpoints.dart';
import 'package:startick/data/remote/model/login_dto.dart';
import 'package:startick/data/remote/model/response_dto.dart';
import 'package:startick/data/remote/model/unit_dto.dart';
import 'package:startick/data/remote/networking.dart';

class AuthRepo {
  ///For Login Api
  static Future<ResponseDto<LoginDto?>> login(
    // String userType,
    String email,
    //  String password
  ) async {
    ///In a userType organizer is equal 2 and user is equal to 1;
    // String type = userType == 'Organiser' ? "2" : "1";
    final responseDto = await httpPost<LoginDto>(
      Endpoints.login,
      {
        // "user_type": type,
        "email": email,
        //  "password": password
      },
    );
    if (responseDto.isSuccessful &&
        responseDto.baseUrl != null &&
        responseDto.userType != null) {
      Prefs.baseUrl.set(responseDto.baseUrl!);
      Prefs.email.set(email);
      Prefs.id.set(responseDto.userId!);
      Prefs.userType.set(responseDto.userType!);
      Prefs.role.set(responseDto.role!);
    } else {
      _clearLocale();
    }
    return responseDto;
  }

  static Future<ResponseDto<UnitDto?>> forgot(
      String userType, String email) async {
    ///In a userType organizer is equal 2 and user is equal to 1;
    String type = userType == 'Organiser' ? "2" : "1";
    final responseDto = await httpPost<UnitDto>(
      Endpoints.forgotPassword,
      {"user_type": type, "email": email},
    );
    return responseDto;
  }

  static Future<ResponseDto<LoginDto?>> otpVerify(String otp) async {
    final responseDto = await httpPost<LoginDto>(
      Endpoints.verifyOTP,
      {"id": Prefs.id.get(), "otp": otp, "user_type": Prefs.userType.get()},
    );
    if (responseDto.isSuccessful && responseDto.data != null) {
      _saveLocale(responseDto.data!);
    }
    return responseDto;
  }

  static Future<ResponseDto<UnitDto?>> resendOtp() async {
    final responseDto = await httpPost<UnitDto>(
      Endpoints.resendOTP,
      {"id": Prefs.id.get(), "user_type": Prefs.userType.get()},
    );
    return responseDto;
  }

  static void logOut() {
    _clearLocale();
  }

  static _saveLocale(LoginDto loginDto) {
    Prefs.logging.set(true);
    Prefs.authToken.set(loginDto.token);
    Prefs.email.set(loginDto.email);
    Prefs.name.set(loginDto.name);
    Prefs.phone.set(loginDto.phone);
    Prefs.profile.set(loginDto.profile ?? "");
    Prefs.gender.set(loginDto.gender ?? "Male");
    Prefs.position.set(loginDto.position ?? "Organiser");
  }

  static _clearLocale() {
    Prefs.gender.clear();
    Prefs.logging.set(false);
    Prefs.userType.clear();
    Prefs.position.clear();
    Prefs.profile.clear();
    Prefs.email.clear();
    Prefs.name.clear();
    Prefs.baseUrl.clear();
    Prefs.role.clear();
    Prefs.id.clear();
    Prefs.phone.clear();
  }

  static UserType getUserTypeByRole(String role) {
    print("Role Check $role");
    switch (role.toLowerCase()) {
      case "ticketmania scanner":
        return UserType.scanner;
      case "mether organizer":
        return UserType.metherOrganizer;
      case "ticketmania organizer":
        return UserType.organizer;
      default:
        return UserType.metherScanner;
    }
  }

  static String getRoleByUserType(UserType type) {
    switch (type) {
      case UserType.organizer:
        return "ticketmania organizer";
      case UserType.scanner:
        return "ticketmania scanner";
      case UserType.metherOrganizer:
        return "mether organizer";
      default:
        return '';
    }
  }
}

enum UserType { scanner, organizer, metherScanner, metherOrganizer }
