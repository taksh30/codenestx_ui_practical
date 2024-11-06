import 'package:flutter/material.dart';

class Tags extends StatelessWidget {
  const Tags({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _textWithIcon('Wine', 'assets/wine.png'),
        _textWithIcon('Music', 'assets/music_img.png'),
        _textWithIcon('Love', 'assets/heart.png'),
        _textWithIcon('Peace', 'assets/peace.png'),
      ],
    );
  }

  Widget _textWithIcon(String title, String image) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          color: Colors.grey.shade100,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Row(
            children: [
              Image.asset(
                image,
                height: 15,
                width: 15,
              ),
              const SizedBox(
                width: 3.0,
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 12.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
