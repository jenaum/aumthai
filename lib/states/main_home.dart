import 'package:aum_thai_v1/body/body_checkin.dart';
import 'package:aum_thai_v1/body/body_history.dart';
import 'package:aum_thai_v1/utility/app_controller.dart';
import 'package:aum_thai_v1/utility/app_service.dart';
import 'package:aum_thai_v1/utility/app_snacckbar.dart';
import 'package:aum_thai_v1/utility/my_constant.dart';
import 'package:aum_thai_v1/widgets/widget_icon_button.dart';
import 'package:aum_thai_v1/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  var titles = <String>[
    'Check In',
    'History',
  ];

  var iconDatas = <IconData>[
    Icons.check_box,
    Icons.history,
  ];

  var bodys = <Widget>[
    const BodyCheckIn(),
    const BodyHistory(),
  ];
  var bottonBarItens = <BottomNavigationBarItem>[];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < titles.length; i++) {
      bottonBarItens.add(
        BottomNavigationBarItem(
          icon: Icon(
            iconDatas[i],
          ),
          label: titles[i],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: AppController(),
      builder: (AppController appController) {
        // print('ini => ${appController.indexBody}');
        return Scaffold(
          appBar: AppBar(
            title: WidgetText(data: titles[appController.indexBody.value]),
            actions: appController.indexBody.value == 0
                ? [
                    WidgetIconButton(
                      iconData: Icons.qr_code,
                      pressFunc: () {
                        double distance = AppService().calculateDistance(
                            appController.positions.last.latitude,
                            appController.positions.last.longitude,
                            MyConstant.officeLatLng.latitude,
                            MyConstant.officeLatLng.longitude);
                        print("distance --> $distance");

                        if (distance <= MyConstant.radiusOffice) {
                          // Can CheckIn

                        } else {
                          AppSnackBar(
                                  title: "ไม่สามารถ CheckIn",
                                  message:
                                      "ระยะห่าง คุณคือ $distance เมตร คุณไม่ได้อยู่ใน Office")
                              .errorSnackBar();
                        }
                      },
                    ),
                    WidgetIconButton(
                      iconData: Icons.refresh,
                      pressFunc: () {
                        AppService().findPosition(context: context);
                      },
                    )
                  ]
                : [],
          ),
          body: bodys[appController.indexBody.value],
          bottomNavigationBar: BottomNavigationBar(
            items: bottonBarItens,
            currentIndex: appController.indexBody.value,
            onTap: (value) {
              appController.indexBody.value = value;
            },
          ),
        );
      },
    );
  }
}
