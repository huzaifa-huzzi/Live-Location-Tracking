import 'package:dart_location_app/View/Forgot%20password/Forgot%20password.dart';
import 'package:dart_location_app/View/HomeScreen/Home_Screen.dart';
import 'package:dart_location_app/View/Login_Screen/login_Screen.dart';
import 'package:dart_location_app/View/Register/Register_Screen.dart';
import 'package:dart_location_app/View/ThemeChanging/ThemeChanging.dart';
import 'package:dart_location_app/View/Track%20Location/Track_Location.dart';
import 'package:dart_location_app/View/splash/Splash_Screen.dart';
import 'package:dart_location_app/utills/Routes/Routes%20Name.dart';
import 'package:flutter/material.dart';

class Routes{

  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());

      case RoutesName.register:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());

      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case RoutesName.forgotPassword:
        return MaterialPageRoute(builder: (context) => const ForgotPassword());


      case RoutesName.trackLocation:
        return MaterialPageRoute(builder: (context) => const TrackLocation());

      case RoutesName.theme:
        return MaterialPageRoute(builder: (context) => const ThemeChanging());



      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text('No Routes Find'),
            ),
          );
        });

    }


  }




}