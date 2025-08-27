import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startick/ui/screens/home/home_viewmodel.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';

class CurrentIndexView extends StatelessWidget {
  final int eventsCount;

  const CurrentIndexView({super.key, required this.eventsCount});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 12,
      right: 12,
      child: Selector<HomeViewModel, int>(
        builder: (ctx, current, child) => Row(
          children: [
            ...List.generate(
              eventsCount,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor:
                      // ignore: deprecated_member_use
                      Colors.white.withOpacity(index == current ? 1 : 0.5),
                ),
              ),
            ),
            const Spacer(),
            const CustomImage(
              source: 'assets/info.png',
              height: 20,
            )
          ],
        ),
        selector: (ctx, pro) => pro.currentIndex,
      ),
    );
  }
}
