import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startick/ui/screens/ticket_scanning/ticket_scan_model.dart';
import 'package:startick/ui/screens/ticket_scanning/widgets/count_view.dart';
import 'package:startick/ui/screens/ticket_scanning/widgets/details_show.dart';
import 'package:startick/ui/themes/colors.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/widgets/common_button.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';

class TicketDetailWidget extends StatelessWidget {
  final bool isDetail;

  const TicketDetailWidget(this.isDetail, {super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        const CustomImage(source: 'assets/vector.png'),
        Positioned(
          top: 10,
          left: 0,
          right: 0,
          bottom: isDetail ? 0 : null,
          child: ColoredBox(
            color: Colors.white,
            child: Column(
              children: [
                isDetail ? const DetailsShow() : const CountView(),
                Container(
                  color: Colors.white,
                  width: size.width,
                  padding: const EdgeInsets.only(bottom: 25, top: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CommonButton(
                        width: isDetail ? 200 : 240,
                        child: Text(
                          isDetail ? "Ok, Verified" : "Proceed to Check In",
                          style: Inter.semiBold(Colors.white).s18,
                        ),
                        onClick: () {
                          final provider = context.read<TicketScanModel>();
                          if (isDetail) {
                            provider.ticketStatus = TicketStatus.select;
                          } else {
                            provider.updateCount();
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: AppColors.buttonColor,
                  thickness: 2,
                  height: 2,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
