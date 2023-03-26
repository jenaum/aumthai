import 'package:aum_thai_v1/utility/app_controller.dart';
import 'package:aum_thai_v1/utility/app_service.dart';
import 'package:aum_thai_v1/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowQrCode extends StatefulWidget {
  const ShowQrCode({super.key});

  @override
  State<ShowQrCode> createState() => _ShowQrCodeState();
}

class _ShowQrCodeState extends State<ShowQrCode> {
  @override
  void initState() {
    super.initState();

    AppService().readQrModel();
  }

  @override
  Widget build(BuildContext context) {
    return GetX(
        init: AppController(),
        builder: (AppController appController) {
          print("## qrModel --> ${appController.qrModels.length}");
          return Scaffold(
            appBar: AppBar(
              title: const WidgetText(data: "QR Code"),
            ),
            body: appController.qrModels.isEmpty
                ? const SizedBox()
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                          'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=${appController.qrModels.last.qrcode}'),
                      WidgetText(
                        data: appController.qrModels.last.qrcode,
                      ),
                    ],
                  ),
          );
        });
  }
}
