import 'package:aum_thai_v1/models/qr_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  RxInt indexBody = 0.obs;

  RxList<Position> positions = <Position>[].obs;

  RxList<QrModel> qrModels = <QrModel>[].obs;
}
