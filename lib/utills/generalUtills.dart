import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class GeneralUtils{

    static focusftn(BuildContext context,FocusNode current,FocusNode next){
      FocusScope.of(context).requestFocus(next);

    }

  static ToastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
       backgroundColor: Colors.red,
       textColor: Colors.white
    );



  }

}