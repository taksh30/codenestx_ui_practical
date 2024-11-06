import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void onChangeIndex(int index) {
    selectedIndex.value = index;
  }
}
