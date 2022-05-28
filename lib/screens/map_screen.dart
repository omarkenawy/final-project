
import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:uuid/uuid.dart';


class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.orangeAccent,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon:Icon(Icons.menu),
                onPressed: () {  },
              ),
            ),
          ],
        title: Center(
          child: Text(
            'Tawsela',
            style: TextStyle(
              fontSize: 28,
              color: Colors.black
            ),
          ),
        ),
      ),


      body:Map()
    );
  }
}

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  late GoogleMapController mapController;
  static const _initialPosition = LatLng(30.033333, 31.233334);
  LatLng _lastPosition = _initialPosition;
  final Set<Marker> _markers = {};
  @override
  Widget build(BuildContext context) {
    return  Stack(

      children: <Widget>[
        GoogleMap(
          initialCameraPosition:CameraPosition(
              target: _initialPosition,
              zoom: 10),
          onMapCreated: onCreated,
          myLocationButtonEnabled: true,
          mapType: MapType.normal,
          compassEnabled: true,
          markers: _markers,
          onCameraMove: _onCameraMove,
        ),
        
        Positioned(
        top: 40, 
          right: 10,
          child: FloatingActionButton(
            onPressed: _onAddMarkerPressed,
            tooltip: "add marker",
            backgroundColor: Colors.blue,
            child: Icon(Icons.add_location,
            color: Colors.white,
            ),
          )
        ),
      ],
    );
  }

  void onCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  void _onCameraMove(CameraPosition position) {
    setState(() {
      _lastPosition = position.target;
    });
  }

  void _onAddMarkerPressed() {
    setState(() {
      _markers.add(Marker(markerId: MarkerId(_lastPosition.toString()),
        position: _lastPosition,
        infoWindow: InfoWindow(
          title: "remember here",
          snippet: "good place"
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }
}
void onNotification() {
  print('notification clicked');
}
