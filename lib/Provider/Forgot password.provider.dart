import 'package:dart_location_app/utills/generalUtills.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';


class ForgotPasswordProvider with ChangeNotifier{
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _loading = false;
  bool get   loading =>_loading;


  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }


  void forgotPasswordFtn(BuildContext context,String email){
    setLoading(true);

    try{
      auth.sendPasswordResetEmail(email: email).then((value){
        GeneralUtils.ToastMessage('We have send you email kindly check it out');
        setLoading(false);
      }).onError((error, stackTrace){
        GeneralUtils.ToastMessage(error.toString());
        setLoading(true);
      });

    }catch(e){
      GeneralUtils.ToastMessage(e.toString());
      setLoading(false);
    }


  }





}