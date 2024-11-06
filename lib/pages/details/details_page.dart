import 'package:codnestx_ui_practical/constants/app_strings.dart';
import 'package:codnestx_ui_practical/models/event.dart';
import 'package:codnestx_ui_practical/models/guest.dart';
import 'package:codnestx_ui_practical/pages/details/components/event_details.dart';
import 'package:codnestx_ui_practical/pages/details/components/guest_image_with_title.dart';
import 'package:codnestx_ui_practical/pages/details/controller.dart/details_controller.dart';
import 'package:codnestx_ui_practical/pages/details/components/map_location.dart';
import 'package:codnestx_ui_practical/pages/home/components/tags.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key, required this.event});
  final Event event;
  final DetailsController controller = Get.put(DetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Event Images
                    _eventImages(context),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Event Details
                          EventDetails(event: event),
                          const SizedBox(
                            height: 12.0,
                          ),

                          // Description
                          const Text(
                            'Description',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0,
                            ),
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: AppStrings.description,
                                  style: TextStyle(color: Colors.grey.shade500),
                                ),
                                const TextSpan(
                                  text: '\tRead More...',
                                  style: TextStyle(color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),

                          // Event Tags
                          const Tags(),
                          const SizedBox(
                            height: 8.0,
                          ),

                          // Guests
                          const Row(
                            children: [
                              Text(
                                'Guests',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '36',
                                style: TextStyle(color: Colors.green),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),

                          // Guest images with title
                          SizedBox(
                            height: 100.0,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: guests.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 12.0),
                              itemBuilder: (context, index) {
                                return GuestImageWithTitle(
                                    guest: guests[index]);
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 14.0,
                          ),

                          // Information
                          _information(context),
                          const SizedBox(
                            height: 8.0,
                          ),

                          // Location
                          const Text(
                            'Location',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0,
                            ),
                          ),
                          Text(
                            event.location,
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w500,
                              fontSize: 13.0,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),

                          // Map location
                          const MapLocation(),

                          const SizedBox(
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(21.0),
                      topRight: Radius.circular(21.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(0, -3),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    children: [
                      // Chat icon
                      Container(
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border:
                                Border.all(color: Colors.green, width: 2.0)),
                        child: const Icon(Icons.chat_bubble_outline,
                            color: Colors.green),
                      ),
                      const SizedBox(width: 10),

                      // Join now button
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text('Join Now',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _information(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(17.0),
          border: Border.all(
            color: Colors.green,
            width: 1.0,
          )),
      child: Row(
        children: [
          const Icon(
            Icons.perm_device_information_outlined,
            color: Colors.green,
          ),
          const SizedBox(
            width: 5.0,
          ),
          Expanded(
            child: Text(
              AppStrings.information,
              style: const TextStyle(
                  color: Colors.green,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _eventImages(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: PageView.builder(
            onPageChanged: (value) {
              controller.onChangePageIndex(value);
            },
            itemCount: event.images.length,
            itemBuilder: (context, index) {
              return Image.network(
                event.images[index],
                height: 150,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        Obx(
          () => Positioned(
            bottom: 35,
            right: MediaQuery.of(context).size.width * 0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                event.images.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 8,
                    width: controller.pageIndex.value == index ? 24 : 8,
                    decoration: BoxDecoration(
                      color: controller.pageIndex.value == index
                          ? Colors.green
                          : Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 16,
          left: 16,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Get.back(),
          ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: const Icon(
              Icons.more_horiz,
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.27,
          left: 0,
          right: 0,
          child: Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(
                  20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
