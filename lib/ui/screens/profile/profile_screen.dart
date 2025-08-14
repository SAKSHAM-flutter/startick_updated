import 'package:flutter/material.dart';
import 'package:startick/data/local/shared_pref.dart';
import 'package:startick/ui/screens/profile/profile_viewmodel.dart';
import 'package:startick/ui/screens/profile/widgets/profile_name_view.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/base_class/base_screen.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';

class ProfileScreen extends StatelessWidget {
  static const String route = "profileScreen";

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenBaseScaffold<ProfileModel>(
      navigation: Container(
        height: 80,
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.only(bottom: 15),
        child: const CustomImage(
          source: 'assets/profile_bottom.png',
          height: 80,
          fit: BoxFit.fitHeight,
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        children: [
          const ProfileNameView(true),
          const SizedBox(height: 15),
          Card(
            color: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textView("User Type", Prefs.role.get().toUpperCase()),
                  // textView("Gender", Prefs.gender.get()),
                  // textView("Phone Number", Prefs.phone.get()),
                  textView("Email", Prefs.email.get()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column textView(String title, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Inter.medium().s16,
        ),
        Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Inter.regular(const Color(0xFF515151)).s14,
        ),
        if (title != 'Email') const SizedBox(height: 20),
      ],
    );
  }
}
