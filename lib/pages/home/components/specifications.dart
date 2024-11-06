import 'package:flutter/material.dart';

class Specifications extends StatelessWidget {
  const Specifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _specificationCard('London', Icons.location_on_outlined),
        _specificationCard('19-20 Sept', Icons.calendar_month_outlined),
        _specificationCard('Categories', Icons.category),
      ],
    );
  }

  Widget _specificationCard(String title, IconData icon) {
    return SizedBox(
      height: 45,
      width: 105,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              8,
            ),
          ),
        ),
        color: Colors.white,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.black54,
                size: 16.0,
              ),
              const SizedBox(
                width: 4.0,
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 12, color: Colors.black87),
              )
            ],
          ),
        ),
      ),
    );
  }
}
