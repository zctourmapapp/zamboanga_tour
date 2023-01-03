import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:zambo_tour_app/widgets/text_widget.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            splashColor: Colors.transparent,
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.orange,
            )),
      ),
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              Flexible(
                  flex: 1,
                  child: SizedBox(
                    width: Get.width,
                    height: Get.height,
                    child: SvgPicture.asset('./assets/logo/logo.svg'),
                  )),
              Flexible(
                  flex: 2,
                  child: SizedBox(
                    width: Get.width,
                    height: Get.height,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                      child: Column(
                        children: const [
                          TextWidget(
                            title:
                                "Zambo tour application is a tourist application to guide tourist "
                                "with in Zamboanga City and the app will not handle any transaction that may "
                                "include reservation of hotels and restaurant "
                                "Zambo tour app will only delivery of viewing tourist spots hotels and restaurant and "
                                "allowing users to interact with the application by getting the location of areas "
                                "and a provide a navigation feature to users for them to have guidance to "
                                "traveling within the City of Zamboanga, any islands travel will be redirect to "
                                "tourism agency of Zamboanga city"
                                "\n\nZambo tour app was developed by our team Abie Amparo, Rina Laine Cruz and Cez jamsury.",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
