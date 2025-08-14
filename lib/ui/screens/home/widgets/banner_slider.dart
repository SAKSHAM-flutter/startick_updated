import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startick/data/remote/model/banner_dto.dart';
import 'package:startick/ui/screens/home/home_viewmodel.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';
import 'package:tuple/tuple.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomeViewModel, Tuple2<int, List<BannerDto>>>(
      selector: (ctx, pro) => Tuple2(pro.bannerIndex, pro.banners),
      builder: (context, items, child) {
        if (items.item2.isEmpty) {
          return const SizedBox.shrink();
        }
        return Column(
          children: [
            Stack(
              children: [
                CarouselSlider(
                  items: List<Widget>.generate(
                    items.item2.length,
                    (index) => GestureDetector(
                      onTap: () {
                        final pro = context.read<HomeViewModel>();
                        pro.clickToLaunch(items.item2[index]);
                      },
                      child: CustomImage(
                        source: items.item2[index].adsImage,
                        fit: BoxFit.fill,
                        radius: 12,
                        width: MediaQuery.sizeOf(context).width - 40,
                      ),
                    ),
                  ),
                  options: CarouselOptions(
                    onPageChanged: (value, reason) =>
                        context.read<HomeViewModel>().bannerIndex = value,
                    height: 85,
                    autoPlay: false,
                    scrollDirection: Axis.horizontal,
                    viewportFraction: 1,
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 35,
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF000000).withOpacity(0.5),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        items.item2.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: CircleAvatar(
                            radius: 4,
                            backgroundColor: Colors.white.withOpacity(
                              index == items.item1 ? 1 : 0.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 35,
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    color: const Color(0xFF000000).withOpacity(0.5),
                    child: Text(
                      "Ad",
                      style: Inter.bold(Colors.white).s10,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
