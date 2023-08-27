import 'package:flutter/material.dart';
import 'package:oshigamimeguri/background.dart';
import 'package:oshigamimeguri/google_map_page.dart';
import 'package:oshigamimeguri/page_serch.dart';
import 'package:oshigamimeguri/shrine_cetner.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:oshigamimeguri/shrine_cetner.dart';

class Explain extends StatelessWidget {
  Explain({super.key, required this.shrine});

  final shrineCenter shrine;

  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final _center = LatLng(shrine.lat, shrine.lng);
    return Scaffold(
      body: Stack(children: [
        Background(),
        Container(
          width: _screenSize.width,
          height: _screenSize.height * 0.2,
          child: Image.asset('images/headerLogo.png'),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Search(),
              ),
            );
          },
          child: Container(
            alignment: Alignment.centerLeft,
            width: _screenSize.width,
            height: _screenSize.height * 0.4,
            child: Image.asset('images/backbotton.png'),
          ),
        ),
        Align(
          alignment: Alignment(0, -0.38),
          child: Container(
            width: _screenSize.width,
            height: _screenSize.height * 0.2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                width: _screenSize.width * 0.8,
                height: _screenSize.height * 0.3,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 20,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId(shrine.godID),
                      position: LatLng(shrine.lat, shrine.lng),
                    )
                  },
                  // 他のGoogleMapのプロパティ...
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment(0, 0.32),
          child: Container(
            width: _screenSize.width,
            height: _screenSize.height * 0.3,
            child: Image.asset('images/guideboard.png'),
          ),
        ),
        Align(
          alignment: Alignment(0, 0.7),
          child: Container(
            width: _screenSize.width,
            height: _screenSize.height * 0.1,
            child: Image.asset('images/effect.png'),
          ),
        ),
        Align(
          alignment: Alignment(0, 0.95),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => GoogleMapPage(shrine: shrine),
                ),
              );
            },
            child: Container(
              width: _screenSize.width,
              height: _screenSize.height * 0.1,
              child: Image.asset('images/gobutton.png'),
            ),
          ),
        )
      ]),
    );
  }
}
