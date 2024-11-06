import 'package:codnestx_ui_practical/pages/home/components/my_custom_painter.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar(
      {super.key, required this.onItemSelected, required this.selectedIndex});
  final Function(int) onItemSelected;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(top: 10),
      child: Stack(
        children: [
          // Custom Painter
          CustomPaint(
            painter: MyCustomPainter(),
            size: Size(MediaQuery.sizeOf(context).width, 80),
          ),

          // Floating Action Button
          Center(
            heightFactor: 0.6,
            child: FloatingActionButton(
              onPressed: () {},
              shape: const CircleBorder(),
              backgroundColor: Colors.green,
              elevation: 10,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),

          // Navigation Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(0, Icons.calendar_today_outlined, 'Lorem',
                    selectedIndex == 0),
                _buildNavItem(
                    1, Icons.book_outlined, 'Lorem', selectedIndex == 1),
                const SizedBox(width: 60),
                _buildNavItem(2, Icons.notifications_none_outlined, 'Lorem',
                    selectedIndex == 2),
                _buildNavItem(
                    3, Icons.mail_outline, 'Lorem', selectedIndex == 3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Navigation Button Widget
  Widget _buildNavItem(
      int index, IconData icon, String label, bool isSelected) {
    return GestureDetector(
      onTap: () => onItemSelected(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.green : Colors.grey,
            size: 18,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.green : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
