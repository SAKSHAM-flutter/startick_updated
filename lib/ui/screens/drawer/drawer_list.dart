import 'package:flutter/material.dart';
import 'package:startick/data/local/shared_pref.dart';
import 'package:startick/ui/screens/profile/widgets/other_view.dart';
import 'package:startick/ui/themes/colors.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/custom_extension.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';

class DrawerList extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final bool toProfile;

  const DrawerList(
      {super.key, required this.scaffoldKey, required this.toProfile});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.5,
      height: MediaQuery.sizeOf(context).height,
      color: Colors.white,
      child: ListView(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.only(left: 16, right: 16),
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.transparent),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Container(
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.buttonColor,
                  ),
                  padding: const EdgeInsets.all(2),
                  child: !Prefs.profile.getSafe().isNullOrEmpty()
                      ? CustomImage(
                          source: Prefs.profile.get(),
                          fit: BoxFit.cover,
                          radius: 50,
                        )
                      : const Icon(Icons.person, size: 50, color: Colors.white),
                ),
                const SizedBox(height: 10),
                Text(
                  Prefs.name.get(),
                  maxLines: 1,
                  overflow: TextOverflow.visible,
                  style: Inter.semiBold().s16,
                ),
              ],
            ),
          ),
          OtherView(scaffoldKey: scaffoldKey, toProfile: toProfile),
        ],
      ),
    );
  }
}
