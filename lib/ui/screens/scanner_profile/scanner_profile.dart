import 'package:flutter/material.dart';
import 'package:startick/data/local/shared_pref.dart';
import 'package:startick/ui/screens/profile/widgets/other_view.dart';
import 'package:startick/ui/screens/profile/widgets/profile_name_view.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';

class ScannerProfile extends StatelessWidget {
  const ScannerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Stack(
        children: [
          const CustomImage(source: "assets/blue_vector1.png"),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: ListView(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              children: [
                const ProfileNameView(false),
                const SizedBox(height: 15),
                Card(
                  elevation: 2,
                  color: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textView(
                          "User Type",
                          Prefs.role.get().toUpperCase(),
                        ),
                        // textView("Gender", Prefs.gender.get()),
                        // textView("Phone Number", Prefs.phone.get()),
                        textView("Email", Prefs.email.get()),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Card(
                  elevation: 2,
                  color: Colors.white,
                  child: OtherView(toProfile: false),
                )
              ],
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
