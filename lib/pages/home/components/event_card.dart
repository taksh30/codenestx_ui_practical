import 'package:codnestx_ui_practical/models/event.dart';
import 'package:codnestx_ui_practical/pages/home/components/tags.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  EventCard({super.key, required this.event, this.onTap});
  final Function()? onTap;
  final Event event;

  // List of guest images
  final List<String> guestsImages = [
    'https://i.pravatar.cc/150?img=12',
    'https://i.pravatar.cc/150?img=13',
    'https://i.pravatar.cc/150?img=14',
    'https://i.pravatar.cc/150?img=15'
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              12.0,
            ),
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 6.0),
        elevation: 0,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: [
              // Event Image
              _eventImage(context),

              // Event Details
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        // Event Name
                        Text(
                          event.name,
                          style: const TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                              fontSize: 17),
                        ),
                        const Spacer(),

                        // Event guest users
                        SizedBox(
                          width: 75,
                          height: 24,
                          child: Stack(
                            children:
                                List.generate(guestsImages.length, (index) {
                              return Positioned(
                                left: index * 15.0,
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundImage:
                                      NetworkImage(guestsImages[index]),
                                ),
                              );
                            }),
                          ),
                        ),
                        const Text(
                          '+30',
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 3.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 17.0,
                          color: Colors.green,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            event.location,
                            style: TextStyle(
                                color: Colors.grey.shade500, fontSize: 11.0),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.calendar_month_outlined,
                          size: 17.0,
                          color: Colors.green,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            'November 15 2023 | 02:00pm - 03:00pm',
                            style: TextStyle(
                                color: Colors.grey.shade500, fontSize: 11.0),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Tags(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Event Image
  Widget _eventImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              event.imageUrl,
              height: 170,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Row(
                children: [
                  Icon(Icons.whatshot, color: Colors.orange, size: 16),
                  SizedBox(width: 4),
                  Text(
                    'Super User',
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                        fontSize: 13.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
