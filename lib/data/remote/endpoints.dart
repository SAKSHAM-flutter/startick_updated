class Endpoints {
  Endpoints._();

  //base url
  // static const oldBaseUrl = ' https://startickets.com.au';
  static const baseUrl = ' https://ticketmania.com.au';
  // static const oldAuthority = 'startickets.com.au';
  static const authority = 'ticketmania.com.au';
  static const path = '';

  // auth APIs
  static const oldLogin = 'login.php';
  static const login = 'login_app_api.php';
  static const forgotPassword = 'forgotpswd.php';
  static const resendOTP = 'resend_otp_api.php';
  static const verifyOTP = 'verify_otp.php';
  static const scanHistory = 'scanHistory.php';
  static const scannerList = 'scanner_list_api.php';
  static const scanResponse = 'scanresponse.php';

  // event APIs
  static const getAllEvent = 'getAllEvent.php';
  static const eventStatistics = 'eventStatistics.php';
  static const eventIN = 'eventIN.php';
  static const inOUTCount = 'InOUTCount.php';
  static const guestList = 'guestList.php';
  static const txnDetails = 'scanresponse.php';
  static const banners = 'ads_image.php';
}
