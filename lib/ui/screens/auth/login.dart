import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startick/ui/screens/auth/auth_viewmodel.dart';
import 'package:startick/ui/screens/auth/otp_screen.dart';
import 'package:startick/ui/screens/auth/widgets/auth_bg.dart';
import 'package:startick/ui/screens/auth/widgets/login_card_widget.dart';
import 'package:startick/ui/utils/base_class/base_screen.dart';
import 'package:startick/ui/utils/base_class/navigation.dart';
import 'package:startick/ui/utils/base_class/view_model.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';

class LoginScreen extends StatefulWidget {
  static const String route = "loginScreen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    withViewModel<AuthViewModel>(context, (viewModel) {
      // ///Scanner Credentials
      // viewModel.emailController.text = "desirocks4@startickets.au";
      // viewModel.passwordController.text = "desirocks4@123";
      // viewModel.user = "Scanner";
      //
      // ///Organizer Credentials
      // // viewModel.emailController.text = "babbug@ticketmania.com.au";
      // // viewModel.passwordController.text = "babbug@123";

      // viewModel.credentialSet();

      ///On Login Call
      viewModel.onLogin = (value) {
        // if (value == 'Organiser') {
        //   CustomNav.namedAndRemoveUntil(context, HomeScreen.route);
        // } else {
        //   CustomNav.namedAndRemoveUntil(context, ScannerHome.route);
        // }
        CustomNav.named(context, OtpScreen.route);
      };
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double topHeight = MediaQuery.sizeOf(context).height;
    bool isKeyBoardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
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
                const AuthBGWidget(text: "Login"),
                Positioned(
                  top: topHeight * 0.3 - 20,
                  left: 30,
                  right: 30,
                  child: const LoginCardWidget(isLogin: true),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
