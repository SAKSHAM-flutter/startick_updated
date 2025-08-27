import 'package:flutter/material.dart';
import 'package:startick/ui/screens/help/widgets/help_button.dart';
import 'package:startick/ui/screens/widgets/back_button.dart';
import 'package:startick/ui/themes/colors.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/colors_helpers.dart';

class HelpScreen extends StatelessWidget {
  static const String route = "/HelpScreen";

  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizedBox sizedBox = const SizedBox(height: 20);
    return SafeArea(
      child: DecoratedBox(
        decoration: BoxDecoration(gradient: appGradient),
        child: Scaffold(
          // backgroundColor: const Color(0xFF18326c),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leadingWidth: 110,
            leading: const BackWidget(Colors.white),
          ),
          body: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    "FOR HELP AND SUPPORT FEEL FREE TO CONTACT US",
                    textAlign: TextAlign.center,
                    style: Inter.semiBold(const Color(0xFFfffeff)).s16,
                  ),
                ),
                const SizedBox(height: 30),
                const HelpButton(
                  image: "assets/whatsapp.png",
                  text: "WHATSAPP",
                  url: "https://wa.me/+61452525005",
                ),
                sizedBox,
                const HelpButton(
                  image: "assets/call.png",
                  text: "CALL US",
                  url: "tel:+61452525005",
                ),
                sizedBox,
                const HelpButton(
                  image: "assets/email.png",
                  text: "EMAIL US",
                  url: "mailto:startickets.au@gmail.com",
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
