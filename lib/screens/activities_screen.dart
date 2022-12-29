import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:zambo_tour_app/widgets/text_widget.dart';
import 'activity_details_screen.dart';
import '../models/activity_model.dart';
import 'package:get/get.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({Key? key}) : super(key: key);

  static const routeName = '/activities';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    List<Activity> activities = Activity.activities;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ActivitiesMasonryGrid(
            width: width,
            activities: activities,
          ),
        ],
      ),
    );
  }
}

class _ActivitiesMasonryGrid extends StatelessWidget {
  const _ActivitiesMasonryGrid({
    Key? key,
    this.masonryCardHeights = const [200, 250, 300],
    required this.width,
    required this.activities,
  }) : super(key: key);

  final List<double> masonryCardHeights;
  final double width;
  final List<Activity> activities;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(10.0),
      itemCount: 9,
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      itemBuilder: (context, index) {
        Activity activity = activities[index];
        return _buildActivityCard(
          context,
          activity,
          index,
        );
      },
    );
  }

  InkWell _buildActivityCard(
    BuildContext context,
    Activity activity,
    int index,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ActivityDetailsScreen(activity: activity),
          ),
        );
      },
      child: Hero(
        tag: '${activity.id}_${activity.title}',
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
                      image: NetworkImage(activity.imageUrl),
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
                          title: activity.title.length > 18
                              ? '${activity.title.substring(0, 18)} . . .'
                              : activity.title,
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
