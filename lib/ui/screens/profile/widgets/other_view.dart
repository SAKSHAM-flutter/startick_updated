import 'package:flutter/material.dart';
import 'package:startick/data/remote/repo/auth_repo.dart';
import 'package:startick/ui/screens/auth/login.dart';
import 'package:startick/ui/screens/help/help_screen.dart';
import 'package:startick/ui/screens/profile/profile_screen.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/base_class/navigation.dart';

class OtherView extends StatelessWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final bool toProfile;

  const OtherView({super.key, this.scaffoldKey, required this.toProfile});

  @override
  Widget build(BuildContext context) {
    const divider = Divider(color: Color(0xFFD9D9D9));
    return Theme(
      data: ThemeData(
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (toProfile) ...[
            InkWell(
              onTap: () {
                scaffoldKey?.currentState?.closeDrawer();
                CustomNav.named(context, ProfileScreen.route);
              },
              child: Container(
                width: 300,
                padding: const EdgeInsets.only(left: 15, bottom: 5, top: 10),
                child: Text(
                  'Profile',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Inter.medium().s16,
                ),
              ),
            ),
            divider,
          ],
          Padding(
            padding: EdgeInsets.only(left: 15, top: toProfile ? 0 : 10),
            child: Text(
              'Account Privacy',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Inter.medium().s16,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'No One',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Inter.regular(const Color(0xFF515151)).s14,
            ),
          ),
          divider,
          InkWell(
            onTap: () {
              scaffoldKey?.currentState?.closeDrawer();
              CustomNav.named(context, HelpScreen.route);
            },
            child: Container(
              width: 300,
              padding: const EdgeInsets.only(left: 15, bottom: 5),
              child: Text(
                'Help',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Inter.medium().s16,
              ),
            ),
          ),
          divider,
          InkWell(
            onTap: () {
              scaffoldKey?.currentState?.closeDrawer();
              AuthRepo.logOut();
              CustomNav.namedAndRemoveUntil(context, LoginScreen.route);
            },
            child: Container(
              width: 300,
              padding: EdgeInsets.only(
                left: 15,
                bottom: scaffoldKey == null ? 10 : 5,
              ),
              child: Text(
                'Log Out',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Inter.medium().s16,
              ),
            ),
          ),
          if (scaffoldKey != null) divider,
        ],
      ),
    );
  }
}
