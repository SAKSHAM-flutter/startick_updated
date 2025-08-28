import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:startick/data/local/shared_pref.dart';
import 'package:startick/data/remote/repo/auth_repo.dart';
import 'package:startick/ui/screens/auth/auth_viewmodel.dart';
import 'package:startick/ui/screens/auth/widgets/auth_bg.dart';
import 'package:startick/ui/screens/home/home_screen.dart';
import 'package:startick/ui/screens/scanner_home/scanner_home.dart';
import 'package:startick/ui/screens/ticket_scanning/ticket_scan_screen.dart';
import 'package:startick/ui/themes/colors.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/base_class/base_screen.dart';
import 'package:startick/ui/utils/base_class/navigation.dart';
import 'package:startick/ui/utils/base_class/view_model.dart';
import 'package:startick/ui/utils/toasts.dart';
import 'package:startick/ui/utils/widgets/common_button.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';

class OtpScreen extends StatefulWidget {
  static const String route = "otpScreen";
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  void initState() {
    withViewModel<AuthViewModel>(context, (provider) {
      provider.onOtpSuccess = () => navigateToNext();
    });
    super.initState();
  }

  void navigateToNext() {
    try {
      UserType type = AuthRepo.getUserTypeByRole(Prefs.role.get());
      switch (type) {
        case UserType.scanner:
          CustomNav.namedAndRemoveUntil(context, TicketScanScreen.route);
          break;
        case UserType.organizer:
          CustomNav.namedAndRemoveUntil(context, HomeScreen.route);
          break;
        case UserType.metherScanner:
          CustomNav.namedAndRemoveUntil(context, ScannerHome.route);
          break;
        case UserType.metherOrganizer:
          CustomNav.namedAndRemoveUntil(context, ScannerHome.route);
          break;
      }
    } catch (_) {
      errorToast("Something Went Wrong!!");
    }
  }

  @override
  Widget build(BuildContext context) {
    double topHeight = MediaQuery.sizeOf(context).height;
    final provider = context.read<AuthViewModel>();
    bool isKeyBoardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    const side = BorderSide(width: 1, color: AppColors.greyBorder);
    const side4 = BorderSide(width: 4, color: AppColors.greyBorder);
    final pinTheme = PinTheme(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: const Border(left: side, top: side, right: side, bottom: side4),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1C000000),
            blurRadius: 14,
            offset: Offset(0, 8),
            spreadRadius: 0,
          )
        ],
      ),
      height: 55,
      width: 70,
    );
    return ScreenBase<AuthViewModel>(
      backClick: true,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        bottomSheet: CustomImage(
          source: 'assets/bottom_img.png',
          width: MediaQuery.sizeOf(context).width,
        ),
        body: SingleChildScrollView(
          physics: isKeyBoardOpen
              ? const BouncingScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          child: GestureDetector(
            onTap: () => context.read<AuthViewModel>().unFocus(),
            child: Stack(
              children: [
                const AuthBGWidget(text: "Enter OTP"),
                Positioned(
                  top: topHeight * 0.3 - 20,
                  left: 30,
                  right: 30,
                  child: Column(
                    children: [
                      Pinput(
                        preFilledWidget: Text(
                          "-",
                          style: Inter.regular(AppColors.greyHint).s18,
                        ),
                        controller: provider.otpController,
                        length: 4,
                        defaultPinTheme: pinTheme,
                        disabledPinTheme: pinTheme,
                        followingPinTheme: pinTheme,
                        submittedPinTheme: pinTheme,
                        errorPinTheme: pinTheme,
                        focusedPinTheme: pinTheme,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () => provider.resendOTP(),
                          child: const Text("Resend OTP"),
                        ),
                      ),
                      const SizedBox(height: 40),
                      CommonButton(
                        text: "Login",
                        width: 150,
                        height: 45,
                        onClick: () => provider.otpVerification(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
