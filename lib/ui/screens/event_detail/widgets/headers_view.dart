import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:startick/ui/screens/event_detail/event_detail_viewmodel.dart';
import 'package:startick/ui/themes/colors.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';

class HeaderView extends StatelessWidget {
  final String title, image;
  final int index;

  const HeaderView({
    super.key,
    required this.title,
    required this.image,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      fit: FlexFit.loose,
      child: InkWell(
        onTap: () => context.read<EventDetailModel>().currentIndex = index,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: index == 0
                ? MainAxisAlignment.start
                : index == 1
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: CustomImage(source: image, height: 20),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Text(
                  title,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: Inter.medium(AppColors.greylight).s14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
