import 'package:flutter/material.dart';

class TitleWithImage extends StatelessWidget {
  const TitleWithImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.light_mode_outlined,
                    color: Colors.green,
                    size: 16,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    'GOOD MORNING',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 6.0,
              ),
              Text(
                'Taksh Panchal',
                style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Spacer(),

          // User Image
          CircleAvatar(
            radius: 26.0,
            backgroundColor: Colors.green,
            child: CircleAvatar(
              radius: 23.0,
              backgroundImage: NetworkImage(
                'https://i.pravatar.cc/150?img=53',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
