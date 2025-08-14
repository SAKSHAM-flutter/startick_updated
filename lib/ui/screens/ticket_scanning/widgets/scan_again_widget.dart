import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startick/data/local/shared_pref.dart';
import 'package:startick/data/remote/repo/auth_repo.dart';
import 'package:startick/ui/screens/ticket_scanning/ticket_scan_model.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';

class WrongQrScan extends StatelessWidget {
  const WrongQrScan({super.key});

  @override
  Widget build(BuildContext context) {
    bool isCoupon =
        AuthRepo.getUserTypeByRole(Prefs.role.get()) == UserType.metherScanner;
    return Material(
      elevation: 0,
      color: const Color(0xFFFFD54E),
      child: Container(
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
          children: [
            const SizedBox(height: 40),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomImage(
                    source: 'assets/booked.png',
                    height: 90,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Please Check Again",
                    style: Inter.semiBold(Colors.white).s22,
                  ),
                  Text(
                    "You can't go",
                    style: Inter.regular(Colors.white).s18,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Make sure you have a right ${isCoupon ? "Coupon" : "Ticket"}",
                    style: Inter.semiBold(Colors.white).s16,
                  ),
                  // const SizedBox(height: 15),
                  // InkWell(
                  //   onTap: () => context.read<TicketScanModel>().ticketStatus =
                  //       TicketStatus.scanning,
                  //   child: Card(
                  //     color: Colors.white.withOpacity(0.2),
                  //     elevation: 0,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(5),
                  //     ),
                  //     child: SizedBox(
                  //       height: 40,
                  //       width: 130,
                  //       child: Center(
                  //         child: Text(
                  //           "Scan Again",
                  //           style: Inter.regular(Colors.white).s16,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
            GestureDetector(
              onTap: () => context.read<TicketScanModel>().ticketStatus =
                  TicketStatus.scanning,
              child: CustomImage(
                source: "assets/scan_agian.png",
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
