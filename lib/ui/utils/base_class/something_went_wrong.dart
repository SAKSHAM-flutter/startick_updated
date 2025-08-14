import 'package:flutter/material.dart';
import 'package:startick/ui/themes/colors.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';

class SomethingWrong extends StatelessWidget {
  static const String route = "/SomethingWrong";

  const SomethingWrong({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width * 0.6;
    VoidCallback? onRefresh =
        ModalRoute.of(context)?.settings.arguments as VoidCallback?;
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
                source: 'assets/icons/something_wrong.png',
                height: 150,
              ),
              const SizedBox(height: 30),
              Text(
                'Something went wrong',
                style: Inter.medium(AppColors.greyLight).s18,
              ),
              const SizedBox(height: 5),
              Text(
                'Try refreshing the page, or try again later.',
                style: Inter.regular(AppColors.greyLight).s12,
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 1),
              ElevatedButton(
                onPressed: () {
                  if (onRefresh != null) {
                    onRefresh.call();
                  } else {
                    Navigator.pop(context);
                  }
                },
                style: ButtonStyle(
                  elevation: WidgetStatePropertyAll(0),
                  backgroundColor: WidgetStatePropertyAll(AppColors.appColor),
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
                  "Refresh Page",
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
