import 'package:flutter/material.dart';
import 'package:startick/ui/themes/colors.dart';
import 'package:startick/ui/themes/typography.dart';
import 'package:startick/ui/utils/widgets/custom_image.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final bool isOrganizer;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.isOrganizer,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem("assets/person.png", 'Profile', 0),
          _buildNavItem(
            "assets/history.png",
            isOrganizer ? 'Coupon' : 'History',
            1,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String icon, String label, int index) {
    return Expanded(
      child: InkWell(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        onTap: () => onItemTapped(index),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (index == selectedIndex)
              Container(
                width: 70,
                height: 80,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.focusColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            Positioned(
              bottom: 32,
              child: CustomImage(
                source: icon,
                height: 20,
                color: selectedIndex == index
                    ? AppColors.buttonColor
                    : AppColors.grey2E,
              ),
            ),
            Positioned(
              bottom: 10,
              child: Text(
                label,
                style: Inter.medium(selectedIndex == index
                        ? AppColors.buttonColor
                        : AppColors.grey2E)
                    .s14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
