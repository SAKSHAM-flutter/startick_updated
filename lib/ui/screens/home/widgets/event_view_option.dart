import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startick/ui/screens/home/home_viewmodel.dart';
import 'package:startick/ui/themes/colors.dart';
import 'package:startick/ui/themes/typography.dart';

class EventViewOption extends StatelessWidget {
  const EventViewOption({super.key});

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(5);
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Selector<HomeViewModel, bool>(
        builder: (ctx, islIst, child) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Events", style: Inter.bold(AppColors.blacktext).s18),
              const Spacer(),
              GestureDetector(
                onTap: () => context.read<HomeViewModel>().listView = true,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: radius, bottomLeft: radius),
                    color: islIst ? AppColors.buttonColor : Colors.transparent,
                  ),
                  child: Icon(
                    Icons.list,
                    color: islIst ? Colors.white : AppColors.greyC73,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => context.read<HomeViewModel>().listView = false,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topRight: radius, bottomRight: radius),
                    color: !islIst ? AppColors.buttonColor : Colors.transparent,
                  ),
                  child: Icon(
                    Icons.grid_view_outlined,
                    color: !islIst ? Colors.white : AppColors.greyC73,
                  ),
                ),
              ),
            ],
          ),
        ),
        selector: (ctx, provider) => provider.listView,
      ),
    );
  }
}
