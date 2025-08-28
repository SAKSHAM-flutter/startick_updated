import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startick/ui/screens/auth/auth_viewmodel.dart';
import 'package:startick/ui/screens/widgets/back_button.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';

class AuthBGWidget extends StatelessWidget {
  final String text;

  const AuthBGWidget({super.key, required this.text});

  // double _getBottomSafePadding(BuildContext context) {
  //   final padding = MediaQuery.of(context).viewPadding.bottom;
  //   return padding > 0 ? padding : 50.0;
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        SizedBox(width: size.width, height: size.height),
        // Positioned(
        //   bottom: 0,
        //   left: 0,
        //   right: 0,
        //   child: Container(
        //     height: size.height,
        //     width: size.width,
        //     padding: EdgeInsets.only(bottom: _getBottomSafePadding(context)),
        //     decoration: const BoxDecoration(
        //       color: Colors.transparent,
        //       image: DecorationImage(
        //         image: AssetImage('assets/auth_back.png'),
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //     alignment: Alignment.bottomCenter,
        //     child: CustomImage(
        //       source: 'assets/bottom_img.png',
        //       width: MediaQuery.sizeOf(context).width,
        //     ),
        //   ),
        // ),
        Container(
          width: size.width,
          height: size.height * 0.3,
          padding: const EdgeInsets.only(bottom: 40),
          decoration: const BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
              image: AssetImage('assets/blue_vector.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (text == "Reset Password") const BackWidget(Colors.white),
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomImage(
                    source: 'assets/orgnizer.png',
                    height: 70,
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Selector<AuthViewModel, String>(
                          selector: (ctx, provider) => provider.user,
                          builder: (context, user, child) {
                            user = "User";
                            return Text(
                              user,
                              style: Inter.semiBold(Colors.white).s20,
                            );
                          },
                        ),
                      ),
                      Text(
                        text,
                        style: Inter.regular(Colors.white).s20.copyWith(),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
