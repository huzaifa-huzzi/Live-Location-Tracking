import 'dart:async';
import 'package:dart_location_app/utills/Routes/Routes%20Name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class services {

  void isLogin(BuildContext context){
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if(user != null){
      Timer(const Duration(seconds: 4), () {
        Navigator.pushNamed(context, RoutesName.homeScreen);
      });


    }else{
      Navigator.pushNamed(context, RoutesName.login);

    }


  }



}



