import 'package:zambo_tour_app/controller/authentication_controller.dart';
import 'package:get/get.dart';

class BindingsController extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Authentication>(() => Authentication());
  }
}
