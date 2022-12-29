import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zambo_tour_app/controller/authentication_controller.dart';
import 'package:zambo_tour_app/widgets/input_widget.dart';
import 'package:zambo_tour_app/widgets/text_widget.dart';
import 'package:get/get.dart';

class SigninScreen extends GetView<Authentication> {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        flexibleSpace: Container(
          width: Get.width,
          height: 35,
          color: Colors.orange,
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: Get.width,
          height: Get.height * 0.95,
          child: Column(children: [
            Flexible(
              flex: 3,
              child: SizedBox(
                  width: Get.width,
                  height: Get.height,
                  child: SizedBox(
                    width: Get.width,
                    height: Get.height,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: SizedBox(
                          width: 80,
                          height: 80,
                          child: SvgPicture.asset('./assets/logo/logo.svg')),
                    ),
                  )),
            ),
            Flexible(
                flex: 4,
                child: SizedBox(
                  width: Get.width,
                  height: Get.height,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                    child: Column(
                      children: [
                        InputWidget(
                          controller: controller.email,
                          iconData: Icons.email,
                          hintText: "Email",
                          textInputType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 25),
                        InputWidget(
                          controller: controller.email,
                          iconData: Icons.lock,
                          hintText: "Password",
                          textInputType: TextInputType.visiblePassword,
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () {},
                          child: const TextWidget(
                            title: 'forgot password?',
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: Get.width,
                          height: 40,
                          child: MaterialButton(
                            color: Colors.orange,
                            onPressed: () {
                              Get.toNamed('/home');
                            },
                            child: const TextWidget(
                              title: 'Login',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          width: Get.width,
                          height: 40,
                          child: MaterialButton(
                            color: Colors.grey[600],
                            onPressed: () {
                              Get.toNamed('/signup');
                            },
                            child: const TextWidget(
                              title: 'Sign up',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ]),
        ),
      ),
    );
  }
}
