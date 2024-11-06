import 'package:codnestx_ui_practical/models/event.dart';
import 'package:codnestx_ui_practical/pages/details/details_page.dart';
import 'package:codnestx_ui_practical/pages/home/components/custom_bottom_nav_bar.dart';
import 'package:codnestx_ui_practical/pages/home/components/event_card.dart';
import 'package:codnestx_ui_practical/pages/home/components/specifications.dart';
import 'package:codnestx_ui_practical/pages/home/components/title_with_image.dart';
import 'package:codnestx_ui_practical/pages/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title & User Image
              const TitleWithImage(),

              // Date & Time
              const Specifications(),

              // All events card
              Expanded(
                child: ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) => EventCard(
                    event: events[index],
                    onTap: () => Get.to(
                      () => DetailsPage(
                        event: events[index],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: Obx(
        () => CustomBottomNavBar(
          selectedIndex: controller.selectedIndex.value,
          onItemSelected: (index) {
            controller.onChangeIndex(index);
          },
        ),
      ),
    );
  }
}
