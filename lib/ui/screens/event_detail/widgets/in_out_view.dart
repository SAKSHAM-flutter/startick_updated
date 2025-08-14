import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startick/data/remote/model/in_out_dto.dart';
import 'package:startick/ui/screens/event_detail/event_detail_viewmodel.dart';
import 'package:startick/ui/themes/colors.dart';
import 'package:startick/ui/themes/typography.dart';

class InOutView extends StatelessWidget {
  const InOutView({super.key});

  @override
  Widget build(BuildContext context) {
    double radius = 12;
    return SingleChildScrollView(
      child: Selector<EventDetailModel, InOutDto?>(
          selector: (ctx, provider) => provider.inOutDto,
          builder: (context, inOut, child) {
            double width = MediaQuery.sizeOf(context).width - 100;
            bool isGreater = (width * (inOut?.finalPer ?? 1)) >= width;
            return Container(
              height: 200,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: AppColors.buttonColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(radius),
                  bottomLeft: Radius.circular(radius),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x14000000),
                    blurRadius: 38,
                    offset: Offset(0, -2),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 120,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(radius),
                            bottomLeft: Radius.circular(radius),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x14000000),
                              blurRadius: 38,
                              offset: Offset(0, -2),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 25),
                            Text(
                              "Audience Present In Show",
                              style: Inter.medium().s18,
                            ),
                            const SizedBox(height: 20),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 6,
                                      width: width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColors.greyColor,
                                      ),
                                    ),
                                    Container(
                                      height: 6,
                                      width: width * (inOut?.finalPer ?? 1),
                                      decoration: BoxDecoration(
                                        borderRadius: isGreater
                                            ? BorderRadius.circular(10)
                                            : const BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
                                              ),
                                        color: AppColors.buttonColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Container(
                            //   height: 8,
                            //   margin: const EdgeInsets.symmetric(horizontal: 30),
                            //   width: MediaQuery.sizeOf(context).width - 100,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(20),
                            //     gradient: LinearGradient(
                            //       begin: Alignment.centerLeft,
                            //       end: Alignment.centerRight,
                            //       colors: const [
                            //         Color(0xFF41ADFD),
                            //         Color(0xFFE8E8E8),
                            //         Color(0xFFE8E8E8),
                            //         Color(0xFFE8E8E8),
                            //         Color(0xFFE8E8E8),
                            //       ],
                            //       stops: [
                            //         (inOut?.percentage ?? 0),
                            //         0,
                            //         inOut?.remaining ?? 1,
                            //         inOut?.remaining ?? 1,
                            //         inOut?.remaining ?? 1,
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        child: Center(
                          child: Text(
                            "${inOut?.totalIn ?? "0"} / ${inOut?.totalSeat ?? "0"}",
                            style: Inter.bold(Colors.white).s26,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      height: 3,
                      width: MediaQuery.sizeOf(context).width * 0.28,
                      color: AppColors.buttonColor,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
