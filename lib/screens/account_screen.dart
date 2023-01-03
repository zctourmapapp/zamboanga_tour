import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zambo_tour_app/controller/authentication_controller.dart';
import 'package:zambo_tour_app/widgets/input_widget.dart';
import 'package:get/get.dart';
import 'package:zambo_tour_app/widgets/text_widget.dart';

class AccountScreen extends GetView<Authentication> {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        flexibleSpace: Container(
          width: Get.width,
          height: 25,
          color: Colors.orange,
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: Get.width,
          height: Get.height * 0.9,
          child: Stack(
            children: [
              Positioned.fill(
                child: SizedBox(
                  width: Get.width,
                  child: Column(
                    children: [
                      SizedBox(
                        width: Get.width,
                        height: Get.height * 0.25,
                        child: Stack(
                          children: [
                            Positioned.fill(
                                child: Container(
                              width: Get.width,
                              height: Get.height,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                              ),
                              child: Container(
                                width: Get.width,
                                height: Get.height,
                                color: Colors.black12,
                                child: SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Center(
                                      child: CircleAvatar(
                                        radius: 60,
                                        child: TextWidget(
                                          title: controller
                                                  .user.value?.userName![0] ??
                                              "U",
                                          fontSize: 40,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    )),
                              ),
                            )),
                            Positioned(
                                top: 10,
                                left: 10,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 0.5,
                                            spreadRadius: 0.5)
                                      ],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100))),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100))),
                                    child: Center(
                                      child: IconButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          icon: const Icon(
                                            Icons.arrow_back_rounded,
                                            color: Colors.orange,
                                          )),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Get.width,
                        height: Get.height * 0.6,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 18.0, right: 18.0),
                          child: Column(
                            children: [
                              const SizedBox(height: 80),
                              InputWidget(
                                controller: controller.name,
                                textInputType: TextInputType.name,
                                hintText: 'Full name',
                                iconData: Icons.person,
                              ),
                              const SizedBox(height: 25),
                              InputWidget(
                                controller: controller.name,
                                textInputType: TextInputType.name,
                                hintText: 'Contact',
                                iconData: Icons.contact_phone_rounded,
                              ),
                              const SizedBox(height: 25),
                              InputWidget(
                                controller: controller.name,
                                textInputType: TextInputType.name,
                                hintText: 'Email',
                                iconData: Icons.email_rounded,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 30,
                  child: SizedBox(
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                      child: SizedBox(
                          width: Get.width,
                          height: 40,
                          child: MaterialButton(
                            color: Colors.orange,
                            onPressed: (() => controller.signOut()),
                            child: const TextWidget(
                              title: 'Save Changes',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          )),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
