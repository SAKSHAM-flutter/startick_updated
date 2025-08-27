// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:startick/data/local/shared_pref.dart';
import 'package:startick/data/remote/repo/auth_repo.dart';
import 'package:startick/ui/screens/auth/login.dart';
import 'package:startick/ui/screens/ticket_scanning/ticket_scan_model.dart';
import 'package:startick/ui/screens/widgets/back_button.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/base_class/base_screen.dart';
import 'package:startick/ui/utils/base_class/navigation.dart';
import 'package:startick/ui/utils/toasts.dart';
import 'package:startick/ui/utils/widgets/common_button.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';

class ScannerView extends StatefulWidget {
  const ScannerView({super.key});

  static final GlobalKey globalKey = GlobalKey();

  @override
  State<ScannerView> createState() => _ScannerViewState();
}

class _ScannerViewState extends State<ScannerView> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    final provider = context.read<TicketScanModel>();
    final status = context.select<TicketScanModel, PermissionStatus?>(
        (pro) => pro.permissionStatus);
    bool isCoupon =
        AuthRepo.getUserTypeByRole(Prefs.role.get()) == UserType.metherScanner;
    OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: Colors.white.withOpacity(0.5),
      ),
    );
    return ScreenBase<TicketScanModel>(
      child: Theme(
        data: ThemeData(
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.transparent,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          bottomSheet: isCoupon
              ? SizedBox(
                  width: MediaQuery.sizeOf(context).width - 90,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Material(
                        color: Colors.black.withOpacity(0.5),
                        elevation: 0,
                        borderRadius: BorderRadius.circular(5),
                        child: SizedBox(
                          height: 45,
                          child: TextFormField(
                            controller: controller,
                            textAlign: TextAlign.center,
                            style: Inter.semiBold(Colors.white).s16,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(30)
                            ],
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Coupon Code",
                              enabledBorder: border,
                              focusedBorder: border,
                              disabledBorder: border,
                              contentPadding: EdgeInsets.zero,
                              errorBorder: border,
                              focusedErrorBorder: border,
                              hintStyle:
                                  Inter.semiBold(const Color(0xFFA7A7A7)).s16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: CommonButton(
                          onClick: () {
                            if (controller.text.isNotEmpty) {
                              provider.throughCoupon(controller.text);
                            } else {
                              errorToast("Input Coupon Code First!");
                            }
                          },
                          text: "Next",
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
          body: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: size.height,
                width: size.width,
              ),
              if (provider.isCameraAccess(status)) ...[
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: QRView(
                    key: ScannerView.globalKey,
                    onQRViewCreated: (value) {
                      provider.controller = value;
                      value.scannedDataStream.listen(
                        (event) {
                          if (context.mounted) {
                            if (isCoupon) {
                              provider.updateQrCoupon(event.code);
                            } else {
                              provider.updateQr(event.code);
                            }
                          }
                        },
                      );
                    },
                    overlay: QrScannerOverlayShape(
                      cutOutHeight: size.height * 0.4,
                      cutOutWidth: size.width - 90,
                      overlayColor: Colors.black.withOpacity(0.5),
                      borderColor: Colors.white,
                      cutOutBottomOffset: 50,
                      borderRadius: 8,
                      borderLength: 0,
                      borderWidth: 0,
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.68,
                  child: GestureDetector(
                    onTap: () => provider.flashClick(),
                    child: const CustomImage(
                      source: 'assets/flash_light.png',
                      height: 60,
                    ),
                  ),
                ),
                // Positioned(
                //   top: size.height * 0.68 + 90,
                //   left: 45,
                //   right: 45,
                //   child: Column(
                //     children: [
                //       Material(
                //         color: Colors.black.withOpacity(0.5),
                //         elevation: 0,
                //         borderRadius: BorderRadius.circular(5),
                //         child: SizedBox(
                //           height: 45,
                //           child: TextField(
                //             controller: controller,
                //             textAlign: TextAlign.center,
                //             style: Inter.semiBold(Colors.white).s16,
                //             decoration: InputDecoration(
                //               border: InputBorder.none,
                //               hintText: "Enter Coupon Code",
                //               enabledBorder: border,
                //               focusedBorder: border,
                //               disabledBorder: border,
                //               contentPadding: EdgeInsets.zero,
                //               errorBorder: border,
                //               focusedErrorBorder: border,
                //               hintStyle:
                //                   Inter.semiBold(const Color(0xFFA7A7A7)).s16,
                //             ),
                //           ),
                //         ),
                //       ),
                //       const SizedBox(height: 15),
                //       SizedBox(
                //         height: 40,
                //         width: 100,
                //         child: CommonButton(
                //           onClick: () => provider.updateQr(controller.text),
                //           text: "Next",
                //         ),
                //       )
                //     ],
                //   ),
                // ),
              ],
              if (!provider.isCameraAccess(status))
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Material(
                    elevation: 0,
                    child: Container(
                      height: size.height,
                      width: size.width,
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Need A Camera Permission For Scanning Qr Code.Click On Below Button And Provide A Camera Permission",
                            textAlign: TextAlign.center,
                            style: Inter.medium().s14,
                          ),
                          const SizedBox(height: 20),
                          CommonButton(
                            width: 220,
                            height: 45,
                            child: Text(
                              "Enable Camera",
                              style: Inter.semiBold(Colors.white).s14,
                            ),
                            onClick: () => provider.checkPermission(true),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              if (isCoupon)
                const Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Material(
                    elevation: 0,
                    color: Colors.transparent,
                    child: BackWidget(Colors.white),
                  ),
                ),
              if (!isCoupon)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Material(
                    elevation: 0,
                    color: Colors.transparent,
                    child: BackWidget(
                      Colors.white,
                      title: "Logout",
                      onClick: () {
                        AuthRepo.logOut();
                        CustomNav.namedAndRemoveUntil(
                            context, LoginScreen.route);
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
