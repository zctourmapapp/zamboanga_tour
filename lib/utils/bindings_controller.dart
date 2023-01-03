import 'package:zambo_tour_app/controller/authentication_controller.dart';
import 'package:get/get.dart';
import 'package:zambo_tour_app/controller/hotel_controller.dart';
import 'package:zambo_tour_app/controller/restaurant_controller.dart';
import 'package:zambo_tour_app/controller/tourist_spot_controller.dart';

class BindingsController extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Authentication>(() => Authentication());
    Get.lazyPut<HotelController>(() => HotelController());
    Get.lazyPut<RestaurantController>(() => RestaurantController());
    Get.lazyPut<TouristSpotController>(() => TouristSpotController());
  }
}
