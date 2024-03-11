import 'package:dart_location_app/utills/generalUtills.dart';
import 'package:geolocator/geolocator.dart';



class  LocationTracking {

  Future<Position> getUserCurrentLocation() async{

     await Geolocator.requestPermission().then((value){

     }).onError((error, stackTrace){
       GeneralUtils.ToastMessage(error.toString());
     });

     return await Geolocator.getCurrentPosition();


  }




}