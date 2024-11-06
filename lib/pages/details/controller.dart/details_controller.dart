import 'package:get/get.dart';

class DetailsController extends GetxController {
  RxInt pageIndex = 0.obs;

  void onChangePageIndex(index) {
    pageIndex.value = index;
  }
}
