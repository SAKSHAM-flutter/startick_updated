import 'package:flutter/material.dart';
import 'package:startick/data/local/shared_pref.dart';
import 'package:startick/ui/themes/colors.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/custom_extension.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';

class ProfileNameView extends StatelessWidget {
  final bool isOrganiser;

  const ProfileNameView(this.isOrganiser, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Prefs.name.get().trim().isEmpty ? "User" : Prefs.name.get(),
                  maxLines: 1,
                  overflow: TextOverflow.visible,
                  style: Inter.semiBold(
                          isOrganiser ? AppColors.black : Colors.white)
                      .s20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      Prefs.role.get().toUpperCase(),
                      style: Inter.regular(
                              isOrganiser ? AppColors.grey6C : Colors.white)
                          .s14,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50, right: 8),
                      child: CircleAvatar(
                        backgroundColor: Color(0xFF0CE708),
                        radius: 4,
                      ),
                    ),
                    Text(
                      "Online",
                      style: Inter.regular(
                              isOrganiser ? AppColors.grey3F : Colors.white)
                          .s16,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
