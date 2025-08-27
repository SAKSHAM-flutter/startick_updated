import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startick/data/remote/model/event_dto.dart';
import 'package:startick/ui/screens/home/home_viewmodel.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';

class EventSlider extends StatelessWidget {
  final List<EventDto> eventData;

  const EventSlider({super.key, required this.eventData});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: eventData
          .map((e) => Selector<HomeViewModel, int>(
                selector: (ctx, provider) => provider.currentIndex,
                builder: (context, current, child) {
                  return Stack(
                    children: [
                      CustomImage(
                        source: e.image,
                        height: 240,
                        fit: BoxFit.cover,
                        width: MediaQuery.sizeOf(context).width,
                      ),
                      // const Padding(
                      //   padding: EdgeInsets.symmetric(
                      //       horizontal: 15, vertical: 15),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      // if (current == 0)
                      //   Container(
                      //     margin: const EdgeInsets.only(top: 20,bottom: 5),
                      //     padding: const EdgeInsets.symmetric(
                      //         vertical: 3, horizontal: 5),
                      //     decoration: BoxDecoration(
                      //         color: AppColors.blueColor,
                      //         borderRadius: BorderRadius.circular(5)),
                      //     child: Text(
                      //       "Current Event",
                      //       style: Inter.regular(Colors.white).s12,
                      //     ),
                      //   )
                      // else
                      //   const SizedBox(height: 38),
                      // TitleRow(eventName: e.name /* color: dominantColor*/
                      //     ),
                      // EventSeatRow(
                      //   eventDto: e, /* color: dominantColor*/
                      // ),
                      //   ],
                      // ),
                      // ),
                    ],
                  );
                },
                // ),
              ))
          .toList(),
      options: CarouselOptions(
        onPageChanged: (value, reason) {
          context.read<HomeViewModel>().currentIndex = value;
        },
        autoPlay: false,
        scrollDirection: Axis.horizontal,
        viewportFraction: 1,
      ),
    );
  }
}
