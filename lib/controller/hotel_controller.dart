import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zambo_tour_app/models/hotel_model.dart';

class HotelController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  RxList<Hotel> list = RxList<Hotel>([]).obs();

  String restaurantCollection = 'hotel_tbl';

  @override
  void onInit() {
    initStream();
    super.onInit();
  }

  void initStream() {
    list.bindStream(hotelStream());
  }

  Stream<List<Hotel>> hotelStream() {
    List<Hotel> localList = [];

    Stream<QuerySnapshot> snapshots =
        firestore.collection(restaurantCollection).snapshots();

    snapshots.listen((event) {
      if (event.docs.isNotEmpty) {
        localList.clear();
      }
    });

    return snapshots.map((data) {
      for (var value in data.docs) {
        localList.add(
            Hotel.fromJson(value.data() as Map<String, dynamic>, value.id));
      }

      return localList.toList();
    });
  }
}
