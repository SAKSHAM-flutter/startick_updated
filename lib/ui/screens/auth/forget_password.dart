import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startick/ui/screens/auth/auth_viewmodel.dart';
import 'package:startick/ui/screens/auth/widgets/auth_bg.dart';
import 'package:startick/ui/screens/auth/widgets/login_card_widget.dart';
import 'package:startick/ui/utils/base_class/base_screen.dart';
import 'package:startick/ui/utils/base_class/view_model.dart';

class ForgotPassword extends StatefulWidget {
  static const String route = "ForgotPassword";

  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  void initState() {
    withViewModel<AuthViewModel>(context, (viewModel) {
      // viewModel.onForgetSuccess = () {
      //   Navigator.pop(context);
      //   super.initState();
      // };
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBase<AuthViewModel>(
      child: GestureDetector(
        onTap: () => context.read<AuthViewModel>().unFocus(),
        child: Material(
          elevation: 0,
          child: Stack(
            children: [
              const AuthBGWidget(text: "Reset Password"),
              Positioned(
                top: MediaQuery.sizeOf(context).height * 0.3 - 20,
                left: 30,
                right: 30,
                child: const LoginCardWidget(isLogin: false),
              )
            ],
          ),
        ),
      ),
    );
  }
}
