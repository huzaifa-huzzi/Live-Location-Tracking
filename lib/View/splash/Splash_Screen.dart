import 'package:dart_location_app/Resources/RoundButton.dart';
import 'package:dart_location_app/services/splash_Screen.services.dart';
import 'package:dart_location_app/utills/Routes/Routes%20Name.dart';
import 'package:flutter/material.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration:const  BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/splash 3.png'),fit: BoxFit.fill)
              ),
          child: Padding(
            padding:const EdgeInsets.only(bottom: 30,top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const  SizedBox(height: 30,),
                RoundButton(title: 'Sign in',onpress: (){
                  Navigator.pushNamed(context, RoutesName.login);
                },),
                const  SizedBox(height: 30,),
                RoundButton(title: 'Register',onpress: (){
                  Navigator.pushNamed(context, RoutesName.register);
                },),
              ],
            ),
          ),
            )
      ),
    );
  }
}
