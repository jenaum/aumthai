import 'package:aum_thai_v1/utility/app_controller.dart';
import 'package:aum_thai_v1/utility/app_service.dart';
import 'package:aum_thai_v1/utility/my_colors.dart';
import 'package:aum_thai_v1/utility/my_constant.dart';
import 'package:aum_thai_v1/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BodyCheckIn extends StatefulWidget {
  const BodyCheckIn({super.key});

  @override
  State<BodyCheckIn> createState() => _BodyCheckInState();
}

class _BodyCheckInState extends State<BodyCheckIn> {
  @override
  void initState() {
    super.initState();
    AppService().findPosition(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, BoxConstraints boxConstraints) {
        return GetX(
          init: AppController(),
          builder: (AppController appController) {
            print("Positions===> ${appController.positions.length}");
            return appController.positions.isEmpty
                ? const SizedBox()
                : SizedBox(
                    width: boxConstraints.maxWidth,
                    height: boxConstraints.maxHeight,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                          appController.positions.last.latitude,
                          appController.positions.last.longitude,
                        ),
                        zoom: 16,
                      ),
                      onMapCreated: (controller) {},
                      markers: AppService().createMarkerSet(),
                      circles: <Circle>{
                        Circle(
                          circleId: CircleId("user"),
                          center: LatLng(
                            appController.positions.last.latitude,
                            appController.positions.last.longitude,
                          ),
                          radius: MyConstant.radiusOffice,
                          strokeWidth: 1,
                          fillColor: colorBlueLight.withOpacity(0.25),
                        ),
                      },
                    ),
                  );
          },
        );
      },
    );
  }
}
