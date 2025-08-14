import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startick/ui/screens/ticket_scanning/ticket_scan_model.dart';
import 'package:startick/ui/themes/typography.dart';

class CountView extends StatelessWidget {
  const CountView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double radius = ((size.width - 160) / 5) / 2;
    int selectedCount = context
        .select<TicketScanModel, int>((provider) => provider.peopleCount);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "HOW MANY PATRONS PRESENT TO ENTER FROM THIS TICKET?",
            style: Inter.semiBold().s18,
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: size.width,
            height: (radius * 2) + 65,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, position) => Wrap(
                runAlignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: List.generate(
                  10,
                  (index) {
                    int value = (index + 1) + (position * 10);
                    return GestureDetector(
                      onTap: () {
                        context.read<TicketScanModel>().peopleCount = value;
                      },
                      child: CircleAvatar(
                        radius: radius,
                        backgroundColor: value == selectedCount
                            ? const Color(0xFFECE227)
                            : const Color(0xFF000000).withOpacity(0.6),
                        child: Text(
                          "$value",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: radius,
                            color: value == selectedCount
                                ? Colors.black
                                : Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              itemCount: 2,
            ),
          )
        ],
      ),
    );
  }
}
