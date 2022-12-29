import 'package:zambo_tour_app/controller/authentication_controller.dart';
import 'package:zambo_tour_app/screens/about_screen.dart';
import 'package:zambo_tour_app/screens/account_screen.dart';
import 'package:zambo_tour_app/screens/home_screen.dart';
import 'package:zambo_tour_app/screens/policy_screen.dart';
import 'package:zambo_tour_app/screens/recovery_password_screen.dart';
import 'package:zambo_tour_app/screens/signin_screen.dart';
import 'package:zambo_tour_app/screens/signup_screen.dart';
import 'package:zambo_tour_app/screens/travel_screen.dart';
import 'package:zambo_tour_app/utils/bindings_controller.dart';
import 'package:zambo_tour_app/widgets/menu_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:zambo_tour_app/screens/restaurant_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'screens/activities_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  Get.put(Authentication());
  runApp(const TravelApp());
  FlutterNativeSplash.remove();
}

class TravelApp extends StatelessWidget {
  const TravelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zamboanga Tourism App',
      initialRoute: '/',
      theme:
          ThemeData(primaryColor: Colors.green, primarySwatch: Colors.orange),
      routes: {
        ActivitiesScreen.routeName: (context) => const ActivitiesScreen(),
        HotelsScreen.routeName: (context) => const HotelsScreen(),
      },
      initialBinding: BindingsController(),
      home: const SigninScreen(),
      getPages: [
        GetPage(name: '/', page: () => const SigninScreen()),
        GetPage(name: '/signup', page: () => const SignupScreen()),
        GetPage(name: '/home', page: () => const Home()),
        GetPage(name: '/menu', page: () => const MenuScreen()),
        GetPage(name: '/account', page: () => const AccountScreen()),
        GetPage(name: '/about', page: () => const AboutScreen()),
        GetPage(name: '/policy', page: () => const PolicyScreen()),
        GetPage(name: '/travels', page: () => const TravelScreen()),
        GetPage(name: '/password', page: () => const RecoveryPasswordScreen()),
        GetPage(name: '/activities', page: () => const ActivitiesScreen()),
        GetPage(name: '/hotels', page: () => const HotelsScreen()),
      ],
    );
  }
}
