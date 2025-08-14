import 'package:flutter/material.dart';
import 'package:startick/ui/themes/colors.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';

class TicketScanned extends StatelessWidget {
  const TicketScanned({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: "Scanned",
        child: Container(
          color: const Color(0xFF46B0FE),
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomImage(
                source: 'assets/scanned.png',
                height: 70,
                color: AppColors.greenCol,
              ),
              const SizedBox(height: 8),
              Text(
                "Ticket Scanned",
                style: Inter.semiBold(Colors.white).s22,
              ),
              const SizedBox(height: 3),
              Text(
                "Ready to go",
                style: Inter.regular(Colors.white).s16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
