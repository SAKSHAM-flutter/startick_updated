import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startick/data/local/shared_pref.dart';
import 'package:startick/data/remote/repo/auth_repo.dart';
import 'package:startick/ui/screens/scanner_home/scanner_home_viewmodel.dart';
import 'package:startick/ui/screens/scanner_home/widegts/coustom_bottom_navigation.dart';
import 'package:startick/ui/screens/scanner_profile/scanner_profile.dart';
import 'package:startick/ui/screens/scanning_history/scanning_history.dart';
import 'package:startick/ui/screens/ticket_scanning/ticket_scan_screen.dart';
import 'package:startick/ui/utils/base_class/base_screen.dart';
import 'package:startick/ui/utils/base_class/view_model.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';

class ScannerHome extends StatefulWidget {
  static const String route = "ScannerHome";

  const ScannerHome({super.key});

  @override
  State<ScannerHome> createState() => _ScannerHomeState();
}

class _ScannerHomeState extends State<ScannerHome> {
  @override
  void initState() {
    withViewModel<SCHomeModel>(context, (provider) {
      if (AuthRepo.getUserTypeByRole(Prefs.role.get()) ==
          UserType.metherOrganizer) {
        provider.getCoupanList();
        // provider.getCoupanHistory();
      } else {
        provider.getCoupanHistory();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Check User ${AuthRepo.getUserTypeByRole(Prefs.role.get())}");
    bool isOragnizer = AuthRepo.getUserTypeByRole(Prefs.role.get()) ==
        UserType.metherOrganizer;
    return Selector<SCHomeModel, int>(
      selector: (ctx, pro) => pro.current,
      builder: (context, index, child) {
        return BaseScaffold<SCHomeModel>(
            navigation: CustomBottomNavBar(
              selectedIndex: index,
              isOrganizer: isOragnizer,
              onItemTapped: (value) {
                final provider = context.read<SCHomeModel>();
                provider.current = value;
                if (value == 1) {
                  if (AuthRepo.getUserTypeByRole(Prefs.role.get()) ==
                      UserType.metherOrganizer) {
                    provider.getCoupanList();
                  } else {
                    provider.getCoupanHistory();
                  }
                }
              },
            ),
            actionButton: AuthRepo.getUserTypeByRole(Prefs.role.get()) !=
                    UserType.metherOrganizer
                ? FloatingActionButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, TicketScanScreen.route),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    backgroundColor: Colors.white,
                    child: const CustomImage(
                      source: "assets/scanner.png",
                      height: 80,
                      width: 80,
                    ),
                  )
                : null,
            child: [
              const ScannerProfile(),
              ScanningHistory(isOrgnizer: isOragnizer)
            ][index]);
      },
    );
  }
}
