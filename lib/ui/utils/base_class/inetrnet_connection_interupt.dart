import 'package:flutter/material.dart';
import 'package:startick/ui/themes/colors.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';

class InternetConnection extends StatelessWidget {
  static const String route = "/InternetConnection";

  const InternetConnection({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width * 0.6;
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              const CustomImage(
                source: 'assets/no_internet.png',
                height: 150,
              ),
              const SizedBox(height: 30),
              Text(
                'Oops, No Internet Connection',
                style: Inter.medium(AppColors.greyLight).s18,
              ),
              const SizedBox(height: 5),
              Text(
                'Please check your internet connectivity \nand try again',
                style: Inter.regular(AppColors.greyLight).s12,
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 1),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  elevation: const WidgetStatePropertyAll(0),
                  backgroundColor:
                      const WidgetStatePropertyAll(AppColors.appColor),
                  fixedSize: WidgetStatePropertyAll(
                    Size(width, 45),
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: Text(
                  "Retry",
                  style: Inter.semiBold(Colors.white).s16,
                ),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
