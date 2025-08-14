import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startick/ui/screens/ticket_scanning/ticket_scan_model.dart';
import 'package:startick/ui/screens/ticket_scanning/widgets/checkout_success.dart';
import 'package:startick/ui/screens/ticket_scanning/widgets/scan_again_widget.dart';
import 'package:startick/ui/screens/ticket_scanning/widgets/scanner_view.dart';
import 'package:startick/ui/screens/ticket_scanning/widgets/ticket_detail.dart';
import 'package:startick/ui/screens/ticket_scanning/widgets/ticket_scanned.dart';
import 'package:startick/ui/utils/base_class/view_model.dart';

class TicketScanScreen extends StatefulWidget {
  static const String route = "ticketScanScreen";

  const TicketScanScreen({super.key});

  @override
  State<TicketScanScreen> createState() => _TicketScanScreenState();
}

class _TicketScanScreenState extends State<TicketScanScreen> {
  @override
  void initState() {
    withViewModel<TicketScanModel>(context, (viewModel) {
      viewModel.checkPermission();
    });
    super.initState();
  }

  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Selector<TicketScanModel, TicketStatus>(
        selector: (ctx, provider) => provider.ticketStatus,
        builder: (context, ticketStatus, child) {
          return switch (ticketStatus) {
            TicketStatus.scanning => const ScannerView(),
            TicketStatus.scanned => const TicketScanned(),
            TicketStatus.details => const TicketDetail(true),
            TicketStatus.select => const TicketDetail(false),
            TicketStatus.failed => const WrongQrScan(),
            TicketStatus.checkout => const CheckOutSuccess(),
          };
        },
      ),
    );
  }
}
