import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startick/data/remote/model/coupan_history_dto.dart';
import 'package:startick/ui/screens/profile/widgets/profile_name_view.dart';
import 'package:startick/ui/screens/scanner_home/scanner_home_viewmodel.dart';
import 'package:startick/ui/themes/colors.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';
import 'package:tuple/tuple.dart';

class ScanningHistory extends StatelessWidget {
  final bool isOrgnizer;
  const ScanningHistory({super.key, required this.isOrgnizer});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Stack(
        children: [
          const SizedBox(
            height: 120,
            width: double.infinity,
            child: CustomImage(source: "assets/blue_vector1.png"),
          ),
          Positioned(
            top: 30,
            left: 20,
            right: 20,
            bottom: 0,
            child: Column(
              children: [
                const ProfileNameView(false),
                const SizedBox(height: 20),
                Text(
                  isOrgnizer ? "Coupon History" : "Scan History",
                  maxLines: 1,
                  overflow: TextOverflow.visible,
                  style: Inter.semiBold(AppColors.black).s16.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                ),
                Selector<SCHomeModel, Tuple2<List<CoupanHistoryDto>?, bool>>(
                  selector: (ctx, provider) =>
                      Tuple2(provider.coupons, provider.isLoading),
                  builder: (BuildContext context, items, Widget? child) {
                    if (items.item2 && (items.item1?.isEmpty ?? true)) {
                      return const SizedBox.shrink();
                    }
                    if (!items.item2 && (items.item1?.isEmpty ?? true)) {
                      return Expanded(
                        child: Center(
                          child: Text(
                            "No Coupon ${isOrgnizer ? "Created" : "Scanned"} Yet",
                            style: Inter.medium(Colors.black).s12,
                          ),
                        ),
                      );
                    }
                    return Flexible(
                      child: Card(
                        elevation: 2,
                        color: Colors.white,
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ListView.separated(
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            separatorBuilder: (ctx, index) => const Divider(
                              height: 1.0,
                              color: Color(0xFFD9D9D9),
                            ),
                            itemBuilder: (ctx, position) => ListTile(
                              title: Text(
                                items.item1![position].couponName,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Inter.medium(Colors.black).s18,
                              ),
                              dense: true,
                              // subtitle: Text(
                              //   items.item1![position].couponId
                              //       .toString(),
                              //   maxLines: 1,
                              //   overflow: TextOverflow.ellipsis,
                              //   style:
                              //       Inter.regular(const Color(0xFF515151))
                              //           .s18,
                              // ),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      items.item1![position]
                                          .timeAgoFromString(),
                                      style:
                                          Inter.regular(const Color(0xFF787878))
                                              .s12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            itemCount: items.item1?.length ?? 0,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 50)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
