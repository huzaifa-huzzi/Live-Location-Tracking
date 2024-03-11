import 'package:dart_location_app/services/SessionManager.dart';
import 'package:dart_location_app/utills/Routes/Routes%20Name.dart';
import 'package:dart_location_app/utills/generalUtills.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';



class  LoginProvider with ChangeNotifier{
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('user');
  bool _loading = false;
  bool get loading=>_loading;


  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }


  void loginFtn(String email,String password,String username,BuildContext context)async{
    setLoading(true);
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password).then((value){
        SessionManager().userId = value.user!.uid.toString();
        Navigator.pushNamed(context,RoutesName.homeScreen);
       GeneralUtils.ToastMessage('Login Successful');
        setLoading(false);
        ref.child(value.user!.uid.toString()).set({
          'username':username,
          'uid':value.user!.uid.toString(),
          'email':value.user!.email.toString(),
          'returnSecureToken':true,

        }).then((value){
          GeneralUtils.ToastMessage('Data added ');
          setLoading(false);
        }).onError((error, stackTrace){
          GeneralUtils.ToastMessage(error.toString());
          setLoading(false);
        });
      }).onError((error, stackTrace){
        GeneralUtils.ToastMessage(error.toString());
        setLoading(false);
      });

    }catch(e){
      GeneralUtils.ToastMessage(e.toString());
      setLoading(false);
    }


  }



}