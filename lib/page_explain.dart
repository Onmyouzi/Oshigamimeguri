import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

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
            child: Stack(
              children: [
                Image.asset('images/guideboard.png'),
                Align(
                  alignment: Alignment(0, -0.3),
                  child: Text(
                    shrine.name,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 3.0,
                      fontFamily: 'Lato',
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0.5),
                  child: Container(
                    width: _screenSize.width * 0.7, // コンテナの幅を画面幅に合わせる
                    child: Text(
                      shrine.explanation,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      textAlign: TextAlign.center, // テキストを中央に配置
                      style: TextStyle(
                        // テキストスタイルの設定
                        fontSize: 15.0, // 文字サイズ
                        fontWeight: FontWeight.bold, // 文字の太さ
                        color: Colors.white, // 文字の色
                        letterSpacing: 3.0, // 文字と文字のスペース
                        fontFamily: 'Lato',
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment(0, 0.7),
          child: Container(
            width: _screenSize.width,
            height: _screenSize.height * 0.1,
            child: Stack(
              alignment: Alignment.center, // スタック内の要素を中央に配置
              children: [
                Align(
                  alignment: Alignment.topCenter, // 画像をスタックの上部中央に配置
                  child: Image.asset('images/effect.png'),
                ),
                Align(
                  alignment: Alignment(0, 0.3),
                  child: Text(
                    '無病息災',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 3.0,
                      fontFamily: 'Lato',
                    ),
                  ),
                ),
              ],
            ),
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

//クラス名
class shrineExplain {
  final String explanation;
  final String godID;
  final String name;
  final double lat;
  final double lng;
  final String imageName;

  shrineExplain(
      {required this.explanation,
      required this.godID,
      required this.name,
      required this.lat,
      required this.lng,
      required this.imageName});
}

final shrineProvider = FutureProvider<List<shrineExplain>>((ref) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('shrines').get();

  return snapshot.docs
      .map(
          (doc) => doc.data() as Map<String, dynamic>) // List<Map<index, data>>
      .map((shrine) => shrineExplain(
            lat: shrine['lat'],
            lng: shrine['lng'],
            imageName: shrine['imageName'].toString(),
            explanation: shrine["explanation"].toString(),
            godID: shrine['godID'].toString(),
            name: shrine['name'].toString(),
          )) // List<List<data>>
      .toList();
});
