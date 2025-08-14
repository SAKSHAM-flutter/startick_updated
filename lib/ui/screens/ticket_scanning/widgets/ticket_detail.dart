import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startick/ui/screens/ticket_scanning/ticket_scan_model.dart';
import 'package:startick/ui/screens/ticket_scanning/widgets/ticket_detail_widget.dart';
import 'package:startick/ui/screens/widgets/back_button.dart';
import 'package:startick/ui/themes/colors.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';

class TicketDetail extends StatelessWidget {
  final bool isDetail;

  const TicketDetail(this.isDetail, {super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Material(
      elevation: 0,
      child: Container(
        color: AppColors.backWhite,
        height: size.height,
        width: size.width,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Hero(
              tag: "Scanned",
              child: Container(
                height: 260,
                width: size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFC62EEC),
                      Color(0xFF26CFD0),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomImage(
                      source: 'assets/scanned.png',
                      height: 60,
                      color: AppColors.greenCol,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      isDetail ? "Coupon Scanned" : "Ticket Scanned",
                      style: Inter.semiBold(Colors.white).s26,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      "Ready to go",
                      style: Inter.regular(Colors.white).s18,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 228,
              left: 40,
              right: 40,
              bottom: 0,
              child: TicketDetailWidget(isDetail),
            ),
            Positioned(
              top: 20,
              left: 10,
              child: BackWidget(
                Colors.white,
                onClick: () {
                  final provider = context.read<TicketScanModel>();
                  if (isDetail) {
                    provider.ticketStatus = TicketStatus.scanning;
                  } else {
                    provider.ticketStatus = TicketStatus.details;
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
