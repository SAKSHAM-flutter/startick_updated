import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startick/data/local/shared_pref.dart';
import 'package:startick/data/remote/repo/auth_repo.dart';
import 'package:startick/ui/screens/ticket_scanning/ticket_scan_model.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';

class CheckOutSuccess extends StatelessWidget {
  const CheckOutSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    bool isCoupon =
        AuthRepo.getUserTypeByRole(Prefs.role.get()) == UserType.metherScanner;
    return Material(
      elevation: 0,
      color: const Color(0xFF19396b),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFC62EEC), Color(0xFF26CFD0)],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomImage(
                      source: 'assets/success_icon.png', height: 100),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "${isCoupon ? "COUPON" : "TICKETS"} HAS BEEN VERIFIED SUCCESSFULLY",
                      textAlign: TextAlign.center,
                      style: Inter.semiBold(Colors.white).s15,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      "PLEASE PROCEED TO SCAN NEXT ${isCoupon ? "COUPON" : "TICKETS"}",
                      textAlign: TextAlign.center,
                      style: Inter.semiBold(Colors.white).s15,
                    ),
                  ),
                  if (isCoupon) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Coupon Name: ${context.read<TicketScanModel>().couponName ?? "--"}",
                        textAlign: TextAlign.center,
                        style: Inter.medium(Colors.white).s15,
                      ),
                    ),
                    Text(
                      "Discount Type: ${context.read<TicketScanModel>().discount ?? "--"}",
                      textAlign: TextAlign.center,
                      style: Inter.medium(Colors.white).s15,
                    ),
                  ],
                  const SizedBox(height: 10),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => context.read<TicketScanModel>().ticketStatus =
                  TicketStatus.scanning,
              child: CustomImage(
                source: "assets/success_again.png",
                width: MediaQuery.sizeOf(context).width - 100,
              ),
            ),
            const SizedBox(height: 40)
          ],
        ),
      ),
    );
  }
}
