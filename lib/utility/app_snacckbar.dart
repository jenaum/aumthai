// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aum_thai_v1/utility/my_colors.dart';
import 'package:get/get.dart';

class AppSnackBar {
  final String title;
  final String message;
  AppSnackBar({
    required this.title,
    required this.message,
  });

  void errorSnackBar() {
    Get.snackbar(title, message,
        backgroundColor: colorRedDark, colorText: colorWhite);
  }

  void gooSnackBar() {
    Get.snackbar(title, message,
        backgroundColor: colorGreenDark, colorText: colorWhite);
  }
}
