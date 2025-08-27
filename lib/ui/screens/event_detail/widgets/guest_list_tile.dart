import 'package:flutter/material.dart';
import 'package:startick/data/remote/model/guest_dto.dart';
import 'package:startick/ui/screens/event_detail/event_detail_viewmodel.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';

class GuestListTile extends StatelessWidget {
  final List<GuestDto> guestList;
  final int viewItems;
  final GuestMode mode;

  const GuestListTile({
    super.key,
    required this.guestList,
    required this.viewItems,
    required this.mode,
  });

  @override
  Widget build(BuildContext context) {
    Container vDivider = Container(
      width: 2,
      height: 40,
      // ignore: deprecated_member_use
      color: const Color(0xFFD9D9D9).withOpacity(0.2),
    );
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 30),
      itemBuilder: (ctx, index) {
        GuestDto guest = guestList[index];
        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: 40,
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Text(
                    guest.name,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: Inter.regular().s14,
                  ),
                ),
              ),
              vDivider,
              Expanded(
                flex: 2,
                child: guest.status != 'out'
                    ? Container(
                        height: 40,
                        color: const Color(0xFF96FF9A),
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        child: const Center(
                          child: CustomImage(
                            source: 'assets/check.png',
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              vDivider,
              Expanded(
                flex: 2,
                child: guest.status == 'out'
                    ? Container(
                        height: 40,
                        color: const Color(0xFFFF9696),
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        child: const Center(
                          child: CustomImage(source: 'assets/cross.png'),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        );
      },
      itemCount: viewItems,
    );
  }
}
