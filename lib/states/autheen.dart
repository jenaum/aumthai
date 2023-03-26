import 'dart:convert';

import 'package:aum_thai_v1/models/user_model.dart';
import 'package:aum_thai_v1/states/main_home.dart';
import 'package:aum_thai_v1/utility/app_snacckbar.dart';
import 'package:aum_thai_v1/utility/my_constant.dart';
import 'package:aum_thai_v1/utility/my_texts.dart';
import 'package:aum_thai_v1/widgets/widget_button.dart';
import 'package:aum_thai_v1/widgets/widget_form.dart';
import 'package:aum_thai_v1/widgets/widget_images.dart';
import 'package:aum_thai_v1/widgets/widget_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authen extends StatefulWidget {
  const Authen({super.key});

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  String? user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusScopeNode()),
        child: ListView(
          children: [
            head(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WidgetForm(
                  hint: 'User :',
                  changeFunc: (p0) {
                    user = p0.trim();
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WidgetForm(
                  hint: 'Password',
                  changeFunc: (p0) {
                    password = p0.trim();
                  },
                  obsecu: true,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  width: 250,
                  child: WidgetButton(
                    ladel: "Login",
                    pressFunc: () async {
                      if ((user?.isEmpty ?? true) ||
                          (password?.isEmpty ?? true)) {
                        AppSnackBar(
                          title: "Have Space ?",
                          message: "กรูณากรอกข้อมูลให้",
                        ).errorSnackBar();
                      } else {
                        String urlApiGetUserWhereUser =
                            "https://www.aumthai.com/api/getUaerwhereUser.php?isAdd=true&user=$user";

                        await Dio()
                            .get(urlApiGetUserWhereUser)
                            .then((value) async {
                          if (value.toString() == 'null') {
                            AppSnackBar(
                                    title: "User False",
                                    message: "ไม่มี User ในฐานข้อมูล")
                                .errorSnackBar();
                          } else {
                            for (var element in json.decode(value.data)) {
                              UserModel userModel = UserModel.fromMap(element);

                              if (password == userModel.password) {
                                // Su

                                SharedPreferences preferences =
                                    await SharedPreferences.getInstance();
                                var datas = <String>[];
                                datas.add(userModel.id);
                                datas.add(userModel.iduser);
                                datas.add(userModel.prefix);
                                datas.add(userModel.firstname);
                                datas.add(userModel.lastname);
                                datas.add(userModel.type);

                                preferences
                                    .setStringList("datas", datas)
                                    .then((value) {
                                  Get.offAll(const MainHome());
                                });
                              } else {
                                AppSnackBar(
                                        title: "รหัสไม่ถูกต้อง",
                                        message: "กรุณาใส่รหัสผ่านใหม่")
                                    .errorSnackBar();
                              }
                            }
                          }
                        });
                      }
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Row head() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 100),
          width: 250,
          child: Row(
            children: [
              const WidgetImages(
                size: 50,
              ),
              WidgetText(
                data: MyConstant.appName,
                textStyle: MyTexts().Text30_BD(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
