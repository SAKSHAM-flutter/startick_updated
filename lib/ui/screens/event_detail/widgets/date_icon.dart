import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startick/ui/screens/event_detail/event_detail_viewmodel.dart';

class DateIcons extends StatelessWidget {
  final bool isNext;

  const DateIcons({super.key, required this.isNext});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<EventDetailModel>().onDateChanged(isNext),
      child: Material(
        elevation: 3,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          width: 35,
          height: 35,
          child: Icon(
            isNext ? Icons.keyboard_arrow_right : Icons.keyboard_arrow_left,
          ),
        ),
      ),
    );
  }
}
