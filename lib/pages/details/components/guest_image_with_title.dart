import 'package:codnestx_ui_practical/models/guest.dart';
import 'package:flutter/material.dart';

class GuestImageWithTitle extends StatelessWidget {
  const GuestImageWithTitle({super.key, required this.guest});
  final Guest guest;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 13.0),
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(guest.imageUrl),
            radius: 16,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            guest.name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 10.0),
          ),
        ],
      ),
    );
  }
}
