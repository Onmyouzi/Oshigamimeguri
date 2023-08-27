import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:oshigamimeguri/background.dart';
import 'package:oshigamimeguri/page_explain.dart';
import 'package:oshigamimeguri/shrine_cetner.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class GoogleMapPage extends StatelessWidget {
  GoogleMapPage({super.key, required this.shrine});

  final shrineCenter shrine;
  late GoogleMapController mapController;

  final _center =
      const LatLng(35.01048935789819, 135.74668887675682); //京都府中京区の緯度、経度

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Background(),
          Container(
            width: _screenSize.width,
            height: _screenSize.height * 0.2,
            child: Image.asset('images/headerLogo.png'),
          ),
          Container(
            width: _screenSize.width,
            height: _screenSize.height * 0.6,
            child: Column(children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Explain(
                        shrine: shrine,
                      ),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: _screenSize.width,
                  height: _screenSize.height * 0.07 * 0.6,
                  child: Image.asset('images/backbotton.png'),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  width: _screenSize.width * 0.9,
                  height: _screenSize.height * 0.55,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: _center,
                      zoom: 15,
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
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
