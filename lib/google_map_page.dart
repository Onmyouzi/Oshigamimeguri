import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:oshigamimeguri/page_explain.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});
  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  late GoogleMapController mapController;

  final _center =
      const LatLng(35.01048935789819, 135.74668887675682); //京都府中京区の緯度、経度

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<Set<Marker>> _createMarkers() async {
    QuerySnapshot snapshot = await _firestore.collection('shrines').get();
    final markers = Set<Marker>();

    for (final document in snapshot.docs) {
      final shrines = document.data() as Map<String, dynamic>;
      double lat = shrines['lat'];
      double lng = shrines['lng'];

      Marker marker = Marker(
        markerId: MarkerId(document.id),
        position: LatLng(lat, lng),
      );

      markers.add(marker);
    }

    return markers;
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
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
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Explain()));
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
                  child: FutureBuilder<Set<Marker>>(
                    future: _createMarkers(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Center(child: Text('エラー: ${snapshot.error}'));
                        }
                        return GoogleMap(
                          initialCameraPosition: CameraPosition(
                            target: _center,
                            zoom: 15,
                          ),
                          markers: snapshot.data!,
                          // 他のGoogleMapのプロパティ...
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
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
