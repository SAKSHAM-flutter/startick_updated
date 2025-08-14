import 'package:flutter/material.dart';
import 'package:startick/data/local/shared_pref.dart';
import 'package:startick/ui/screens/profile/profile_screen.dart';
import 'package:startick/ui/themes/colors.dart';
import 'package:startick/ui/utils/custom_extension.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';

class CommonAppBar extends StatefulWidget implements PreferredSizeWidget {
  final VoidCallback? onLeadClick;
  final bool toProfile;

  const CommonAppBar({super.key, this.onLeadClick, this.toProfile = false});

  @override
  State<CommonAppBar> createState() => _CommonAppBarState();

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}

class _CommonAppBarState extends State<CommonAppBar> {
  @override
  Widget build(BuildContext context) {
    bool canBack = Navigator.canPop(context);
    return AppBar(
      backgroundColor: Colors.white,
      leading: Row(
        children: [
          if (canBack)
            IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () {
                if (canBack) {
                  Navigator.pop(context);
                  if (mounted) setState(() {});
                }
              },
            ),
          InkWell(
            onTap: () => widget.onLeadClick?.call(),
            child: Padding(
              padding: EdgeInsets.only(left: canBack ? 0 : 15),
              child: const Icon(Icons.menu),
            ),
          ),
        ],
      ),
      leadingWidth: canBack ? 80 : 40,
      title: Padding(
        padding: EdgeInsets.only(right: canBack ? 30 : 0),
        child: const CustomImage(source: "assets/small_logo.png", width: 150),
      ),
      titleSpacing: 0,
      centerTitle: true,
      actions: [
        if (widget.toProfile)
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, ProfileScreen.route),
            child: Container(
              width: 35,
              height: 35,
              margin: const EdgeInsets.only(right: 20, bottom: 5, top: 5),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.buttonColor,
              ),
              padding: const EdgeInsets.all(2),
              child: Prefs.profile.getSafe().isNullOrEmpty()
                  ? const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 25,
                    )
                  : CustomImage(
                      source: Prefs.profile.get(),
                      fit: BoxFit.cover,
                      radius: 50,
                    ),
            ),
          ),
      ],
    );
  }
}
