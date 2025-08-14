import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startick/data/remote/model/guest_dto.dart';
import 'package:startick/ui/screens/event_detail/event_detail_viewmodel.dart';
import 'package:startick/ui/screens/event_detail/widgets/guest_list_tile.dart';
import 'package:startick/ui/themes/colors.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';
import 'package:startick/ui/utils/widgets/loading.dart';
import 'package:tuple/tuple.dart';

class GuestList extends StatefulWidget {
  const GuestList({super.key});

  @override
  State<GuestList> createState() => _GuestListState();
}

class _GuestListState extends State<GuestList> {
  @override
  Widget build(BuildContext context) {
    final provider = context.read<EventDetailModel>();
    int itemView =
        context.select<EventDetailModel, int>((pro) => pro.itemsShowed);
    Size size = MediaQuery.sizeOf(context);
    Color borderColor = const Color(0xFFD9D9D9).withOpacity(0.2);
    Container vDivider = Container(width: 2, height: 40, color: borderColor);
    Container hDivider =
        Container(width: size.width, height: 2, color: borderColor);
    return Selector<EventDetailModel, Tuple2<bool, GuestMode>>(
      selector: (ctx, provider) =>
          Tuple2(provider.guestLoad, provider.guestMode),
      builder: (context, items, child) {
        List<GuestDto> guests = provider.defaultGuest;
        if (items.item2 != GuestMode.same) {
          guests = provider.guest;
        }
        return Column(
          children: [
            Container(
              height: 40,
              width: size.width,
              color: Colors.white,
              child: Stack(
                children: [
                  Row(
                    children: [
                      withIcon("Name", 5, () {
                        provider.changeGuestMode();
                      }),
                      vDivider,
                      withIcon("IN", 2, () {
                        provider.changeGuestMode(GuestMode.inOrder);
                      }),
                      vDivider,
                      withIcon("OUT", 2, () {
                        provider.changeGuestMode(GuestMode.out);
                      }),
                    ],
                  ),
                  Positioned(
                    left: 0,
                    child: Container(
                      height: 3,
                      width: MediaQuery.sizeOf(context).width * 0.28,
                      color: AppColors.buttonColor,
                    ),
                  ),
                ],
              ),
            ),
            hDivider,
            items.item1
                ? const Center(child: LoadingIndicator())
                : !items.item1 && guests.isEmpty
                    ? Center(
                        child: Text(
                          "No Ticket Booked Yet",
                          style: Inter.semiBold().s14,
                        ),
                      )
                    : GuestListTile(
                        guestList: guests,
                        viewItems: itemView,
                        mode: items.item2,
                      ),
          ],
        );
      },
    );
  }

  Widget withIcon(String title, [int flex = 1, VoidCallback? onTap]) {
    return Expanded(
      flex: flex,
      child: InkWell(
        onTap: () => onTap?.call(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: flex == 5
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.visible,
                  style: Inter.medium().s14,
                ),
              ),
              const SizedBox(width: 10),
              const CustomImage(
                source: 'assets/double_arrow.png',
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
