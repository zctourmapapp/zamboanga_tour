import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zambo_tour_app/models/restaurant_model.dart';

class RestaurantController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  RxList<Restaurant> list = RxList<Restaurant>([]).obs();

  String restaurantCollection = 'restaurant_tbl';

  @override
  void onInit() {
    initStream();
    super.onInit();
  }

  void initStream() {
    list.bindStream(restaurantStream());
  }

  Stream<List<Restaurant>> restaurantStream() {
    List<Restaurant> localList = [];

    Stream<QuerySnapshot> snapshots =
        firestore.collection(restaurantCollection).snapshots();

    snapshots.listen((event) {
      if (event.docs.isNotEmpty) {
        localList.clear();
      }
    });

    return snapshots.map((data) {
      for (var value in data.docs) {
        localList.add(Restaurant.fromJson(
            value.data() as Map<String, dynamic>, value.id));
      }

      return localList.toList();
    });
  }
}
