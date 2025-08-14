import 'package:flutter/material.dart';
import 'package:startick/ui/screens/home/home_viewmodel.dart';
import 'package:startick/ui/screens/home/widgets/banner_slider.dart';
import 'package:startick/ui/screens/home/widgets/home_events.dart';
import 'package:startick/ui/utils/base_class/base_screen.dart';
import 'package:startick/ui/utils/base_class/view_model.dart';

class HomeScreen extends StatefulWidget {
  static const String route = "homeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    withViewModel<HomeViewModel>(context, (viewModel) {
      viewModel.getEvents();
      viewModel.getBanners();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBaseScaffold<HomeViewModel>(
      backClick: true,
      toProfile: true,
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: const Column(
          children: [
            HomeEvents(),
            BannerSlider(),
          ],
        ),
      ),
    );
  }
}
