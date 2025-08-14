import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startick/data/remote/model/txn_dto.dart';
import 'package:startick/ui/screens/ticket_scanning/ticket_scan_model.dart';
import 'package:startick/ui/themes/colors.dart';
import 'package:startick/ui/themes/typography.dart';

class DetailsShow extends StatelessWidget {
  const DetailsShow({super.key});

  @override
  Widget build(BuildContext context) {
    Divider divider = const Divider(color: AppColors.backWhite);
    return Expanded(
      child: Selector<TicketScanModel, TxnDto?>(
          selector: (ctx, provider) => provider.txnDto,
          builder: (context, txnDto, child) {
            return ListView(
              padding: const EdgeInsets.only(bottom: 25,top: 15),
              children: [
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Confirmation Code:",
                    style: Inter.semiBold(AppColors.blueApp).s22,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    txnDto?.code ?? "",
                    style: Inter.semiBold(AppColors.grey5B).s18,
                  ),
                ),
                const SizedBox(height: 5),
                divider,
                textData("Customer Name", txnDto?.customerName ?? ""),
                divider,
                textData("Event Name", txnDto?.eventName ?? ""),
                divider,
                textData("Event Date", txnDto?.eventDatetime ?? ""),
                divider,
                textData("Venue",  txnDto?.eventVenue ?? ""),
                divider,
                textData("Tickets", txnDto?.tickets ?? ""),
                divider,
              ],
            );
          }),
    );
  }

  Widget textData(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 3, bottom: 3, right: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 2,
            textAlign: TextAlign.start,
            overflow: TextOverflow.visible,
            style: Inter.semiBold().s18,
          ),
          const SizedBox(height: 5),
          Text(
            value,
            maxLines: 2,
            textAlign: TextAlign.start,
            overflow: TextOverflow.visible,
            style: Inter.semiBold(AppColors.grey71).s18,
          ),
        ],
      ),
    );
  }
}
