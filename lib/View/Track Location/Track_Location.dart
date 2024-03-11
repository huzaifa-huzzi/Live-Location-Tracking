import 'dart:async';
import 'package:dart_location_app/Provider/LocationTrackingProvider.dart';
import 'package:dart_location_app/utills/generalUtills.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class TrackLocation extends StatefulWidget {
  const TrackLocation({super.key});

  @override
  State<TrackLocation> createState() => _TrackLocationState();
}

class _TrackLocationState extends State<TrackLocation> {
  LocationTracking locationTracking = LocationTracking();
  final Completer<GoogleMapController>_controller = Completer();
  
  static const CameraPosition _kgoogleplex = CameraPosition(
      target: LatLng(33.720001, 73.059998),
      zoom: 14,
  );
  final List <Marker> _marker = [];
  final List <Marker> _list =  [
    const Marker(markerId: MarkerId('1'),
    position: LatLng(33.720001, 73.059998),
    infoWindow: InfoWindow(
      title: 'Wahcantt',
    ),
    
    ),
  ];
  
  
  loadData(){
    locationTracking.getUserCurrentLocation().then((value) async {
      debugPrint('My current Location');
      GeneralUtils.ToastMessage('${value.latitude}${value.longitude}');
      _marker.add(
        Marker(markerId:const  MarkerId('Location '),
            position: LatLng(value.latitude,value.longitude ),
            infoWindow:const  InfoWindow(
              title: 'My current Location',
            )
        ),
      );
      CameraPosition cameraPosition = CameraPosition(
          zoom:  14,
          target: LatLng(value.latitude, value.longitude));

      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      setState(() {

      });
    }).onError((error, stackTrace){
      GeneralUtils.ToastMessage(error.toString());
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title:const  Text('Track Location',),
          centerTitle: true,
        ),
        body: GoogleMap(
          initialCameraPosition: _kgoogleplex,
          mapType: MapType.normal,
          markers: Set<Marker>.of(_marker),
          onMapCreated: (GoogleMapController controller ){
            _controller.complete(controller);
          },
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          loadData();
          
        },child:const  Icon(Icons.location_searching),),
      ),
      );
  }
}
