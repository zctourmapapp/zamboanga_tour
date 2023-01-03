import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:zambo_tour_app/controller/restaurant_controller.dart';
import 'package:get/get.dart';
import 'package:zambo_tour_app/widgets/text_widget.dart';
import '../models/restaurant_model.dart';
import '../widgets/custom_header.dart';
import 'restaurant_details_screen.dart';

class RestuarantScreen extends StatelessWidget {
  const RestuarantScreen({Key? key}) : super(key: key);

  static const routeName = '/hotels';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          const CustomHeader(title: 'Restaurants'),
          _HotelMasonryGrid(
            width: width,
          ),
        ],
      ),
    );
  }
}

class _HotelMasonryGrid extends GetView<RestaurantController> {
  const _HotelMasonryGrid({
    Key? key,
    this.masonryCardHeights = const [200, 250, 300],
    required this.width,
  }) : super(key: key);

  final List<double> masonryCardHeights;
  final double width;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(10.0),
      itemCount: controller.list.length,
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      itemBuilder: (context, index) {
        Restaurant restaurant = controller.list[index];
        return _buildActivityCard(
          context,
          restaurant,
          index,
        );
      },
    );
  }

  InkWell _buildActivityCard(
    BuildContext context,
    Restaurant restaurant,
    int index,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                RestaurantDetailsScreen(restaurant: restaurant),
          ),
        );
      },
      child: Hero(
        tag: '${restaurant.id}_${restaurant.title}',
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: SizedBox(
            height: masonryCardHeights[index % 3],
            child: Stack(
              children: [
                Positioned.fill(
                    child: Container(
                  height: masonryCardHeights[index % 3],
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(restaurant.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
                Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      width: Get.width,
                      height: 30,
                      color: Colors.white54,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 6),
                        child: TextWidget(
                          title: restaurant.title.length > 18
                              ? '${restaurant.title.substring(0, 18)} . . .'
                              : restaurant.title,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
