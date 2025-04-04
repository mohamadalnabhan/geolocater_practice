import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Test2 extends StatefulWidget {
  const Test2({super.key});

  @override
  State<Test2> createState() => _Test2State();
}

class _Test2State extends State<Test2> {

  
Future <void> requestPermissin() async {
  LocationPermission permission = await Geolocator.checkPermission();
  // request location Permission
  if(permission ==LocationPermission.denied){
      permission = await Geolocator.requestPermission();
  }
}
// ask for current location  for once
Future <void> getCurrentLocation() async{
  Position position = await Geolocator.getCurrentPosition(desiredAccuracy:LocationAccuracy.high);

  print("lattitue ${position.latitude} and the longtitude is  ${position.longitude}");
}
// ask for location as a stream 
Stream <Position> getStreamLocation(){
  return Geolocator.getPositionStream(
    locationSettings: LocationSettings( accuracy: LocationAccuracy.high),

  );
}

StreamSubscription<Position>? positionStream;

void startListening() {
  positionStream = Geolocator.getPositionStream().listen((Position position) {
    print("Updated Location: ${position.latitude}, ${position.longitude}");
  });
}

void stopListening() {
  positionStream?.cancel();
}


double calculateDistance (double startLat , startLon , endLat , endLon){
  return Geolocator.distanceBetween(startLat, startLon, endLat, endLon);
}


  Widget build(BuildContext context) {
    return Container();
  }
}