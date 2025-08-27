import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startick/ui/screens/auth/auth_viewmodel.dart';
import 'package:startick/ui/utils/widgets/common_button.dart';
import 'package:startick/ui/utils/widgets/common_text_field.dart';

class LoginCardWidget extends StatefulWidget {
  final bool isLogin;

  const LoginCardWidget({super.key, required this.isLogin});

  @override
  State<LoginCardWidget> createState() => _LoginCardWidgetState();
}

class _LoginCardWidgetState extends State<LoginCardWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = context.read<AuthViewModel>();
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: [
            // if (isLogin) ...[
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Text("User Type", style: Inter.semiBold().s16),
            // ),
            // const SizedBox(height: 10),
            // Selector<AuthViewModel, String?>(
            //   selector: (ctx, provider) => provider.user,
            //   builder: (context, user, child) {
            //     return Container(
            //       height: 45,
            //       width: MediaQuery.sizeOf(context).width,
            //       alignment: Alignment.centerLeft,
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(12),
            //         border: Border.all(color: AppColors.greyBorder),
            //         boxShadow: const [
            //           BoxShadow(
            //             color: Color(0x1C000000),
            //             blurRadius: 14,
            //             offset: Offset(0, 8),
            //             spreadRadius: 0,
            //           )
            //         ],
            //       ),
            //       child: CoolDropdown<String>(
            //         resultOptions: ResultOptions(
            //           boxDecoration: boxDecoration,
            //           openBoxDecoration: boxDecoration,
            //           width: MediaQuery.sizeOf(context).width,
            //           placeholder: "User Type",
            //           placeholderTextStyle: Inter.medium().s16,
            //         ),
            //         dropdownList: provider.types
            //             .map((e) => CoolDropdownItem(label: e, value: e))
            //             .toList(),
            //         dropdownOptions: const DropdownOptions(
            //           borderSide: BorderSide(color: Colors.transparent),
            //         ),
            //         dropdownItemOptions: DropdownItemOptions(
            //           selectedPadding:
            //               const EdgeInsets.symmetric(horizontal: 10),
            //           boxDecoration: boxDecoration,
            //           selectedBoxDecoration: boxDecoration,
            //           selectedTextStyle: Inter.medium().s16,
            //           textStyle: Inter.medium().s16,
            //         ),
            //         defaultItem: CoolDropdownItem(
            //             label: "Organiser", value: "Organiser"),
            //         controller: _controller,
            //         onChange: (value) {
            //           provider.user = value;
            //           _controller.close();
            //         },
            //       ),
            //     );
            //   },
            // ),
            // const SizedBox(height: 10),
            // ],
            if (widget.isLogin)
              CommonField(
                controller: provider.emailController,
                labelText: "Email",
                hintText: "Enter Email Address",
                focusNode: provider.emailFocus,
                onFocusChanged: (value) => provider.onFocusTap(value),
                onNextFocus: (value) => provider.onFocusNext(value),
              ),

            // if (widget.isLogin) ...[
            //   const SizedBox(height: 25),
            //   Selector<AuthViewModel, bool>(
            //       selector: (ctx, provider) => provider.obSecure,
            //       builder: (context, isObSecure, child) {
            //         return CommonField(
            //           controller: provider.passwordController,
            //           labelText: "Password",
            //           focusNode: provider.passFocus,
            //           onFocusChanged: (value) => provider.onFocusTap(value),
            //           onNextFocus: (value) => provider.onFocusNext(value),
            //           hintText: "*********",
            //           obscureText: isObSecure,
            //           suffixIcon: Padding(
            //             padding: const EdgeInsets.only(right: 25),
            //             child: GestureDetector(
            //               onTap: () => provider.changeVisible(),
            //               child: Icon(
            //                 isObSecure
            //                     ? Icons.visibility_off_outlined
            //                     : Icons.visibility_outlined,
            //                 color: AppColors.greyIcon,
            //                 size: 30,
            //               ),
            //             ),
            //           ),
            //         );
            //       }),
            // ],

            const SizedBox(height: 30),
            CommonButton(
              text: widget.isLogin ? "Send OTP" : "Submit",
              width: 150,
              onClick: () => widget.isLogin
                  ? provider.login()
                  : provider.otpVerification(),
            ),
            const SizedBox(height: 20),
            // if (widget.isLogin) ...[
            //   GestureDetector(
            //     onTap: () async {
            //       provider.clearCache();
            //       await CustomNav.named(context, ForgotPassword.route);
            //       provider.clearCache();
            //     },
            //     child: Text(
            //       "Forgot Password?",
            //       style: Inter.medium(AppColors.textBlueColor).s16.copyWith(
            //             decoration: TextDecoration.underline,
            //             decorationColor: AppColors.textBlueColor,
            //           ),
            //     ),
            //   ),
            //   const SizedBox(height: 30),
            // ]
          ],
        ),
      ),
    );
  }
}
