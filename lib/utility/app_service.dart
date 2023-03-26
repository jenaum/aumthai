import 'package:geolocator/geolocator.dart';

class AppService {
  Future<void> findPosition() async {
    bool locationService = await Geolocator.isLocationServiceEnabled();

    if (locationService) {
      /// Open
      
    } else {
      // off
      

    }
  }
}
