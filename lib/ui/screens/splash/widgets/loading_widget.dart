import 'package:flutter/material.dart';
import 'package:startick/ui/screens/splash/splash_function.dart';

class SplashLoading extends StatelessWidget {
  const SplashLoading({super.key});

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(2);
    return ValueListenableBuilder<int>(
      valueListenable: SplashFunction.loading,
      builder: (context, loading, child) {
        return Container(
          height: 10,
          width: MediaQuery.sizeOf(context).width * 0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: const Color(0xFFE1E1E1),
          ),
          padding: EdgeInsets.only(
            right: (MediaQuery.sizeOf(context).width * 0.25) * (loading / 10),
          ),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius:
                  BorderRadius.only(topLeft: radius, bottomLeft: radius),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFFF440DF), Color(0xFFCC1EB7)],
              ),
            ),
          ),
        );
      },
    );
  }
}
