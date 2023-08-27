import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

class Ema extends ConsumerWidget {
  //神社の座標を取得する
  @override
  //UIを書いていく
  Widget build(BuildContext context, WidgetRef ref) {
    final double _deviceWidth = MediaQuery.of(context).size.width;
    final double _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(body: DataFetcher());
  }
}

final locationProvider = FutureProvider((ref) async {
  return await determinePosition();
});

final shrineProvider = FutureProvider<List<shrineCenter>>((ref) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('shrines').get();

  return snapshot.docs
      .map(
          (doc) => doc.data() as Map<String, dynamic>) // List<Map<index, data>>
      .map((shrine) => shrineCenter(
          lat: shrine['lat'],
          lng: shrine['lng'],
          explanation: shrine["explanation"].toString(),
          godID: shrine['godID'].toString(),
          name: shrine['name'].toString(),
          hiraName: shrine['hiraName'].toString())) // List<List<data>>
      .toList();
});

class DataFetcher extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double _deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    final currentPosition = ref.watch(locationProvider);
    final shrineData = ref.watch(shrineProvider);

    // 現在位置のデータがロードされているか確認
    if (currentPosition is AsyncData<Position>) {
      final Position position = currentPosition.value;
      return shrineData.when(
        data: (shrineData) {
          final filterdShrindata = _filterPositionsByDistance(
              shrineData, position.latitude, position.longitude);
          return Material(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: (filterdShrindata.length),
              itemBuilder: (context, index) {
                final data = filterdShrindata[index];

                return Card(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Current Position:'),
                        Text('Latitude: ${position.latitude}'),
                        Text('Longitude: ${position.longitude}'),
                        SizedBox(height: 20),
                        Text('Shrine: ${data.name}'),
                        Text('Latitude: ${data.lat}'),
                        Text('Longitude: ${data.lng}'),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error:')),
      );
    } else if (currentPosition is AsyncError) {
      return Center(child: Text('Location Error:${currentPosition.error}'));
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }
}

//クラス名
class shrineCenter {
  final String explanation;
  final String godID;
  final String hiraName;
  final String name;
  final double lat;
  final double lng;

  shrineCenter(
      {required this.explanation,
      required this.godID,
      required this.hiraName,
      required this.name,
      required this.lat,
      required this.lng});
}

/// デバイスの現在位置を決定する。
/// 位置情報サービスが有効でない場合、または許可されていない場合。
/// エラーを返します
Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // 位置情報サービスが有効かどうかをテストします。
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // 位置情報サービスが有効でない場合、続行できません。
    // 位置情報にアクセスし、ユーザーに対して
    // 位置情報サービスを有効にするようアプリに要請する。
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    // ユーザーに位置情報を許可してもらうよう促す
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // 拒否された場合エラーを返す
      return Future.error('Location permissions are denied');
    }
  }

  // 永久に拒否されている場合のエラーを返す
  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // ここまでたどり着くと、位置情報に対しての権限が許可されているということなので
  // デバイスの位置情報を返す。
  return await Geolocator.getCurrentPosition();
}

List<shrineCenter> _filterPositionsByDistance(
    List<shrineCenter> shrine, double lat, double lng) {
  const double distanceThreshold = 1000000000.0; // 100m

  return shrine.where((position) {
    double distance = _distanceBetween(
      lat,
      lng,
      position.lat,
      position.lng,
    );
    return distance <= distanceThreshold;
  }).toList();
}

double _distanceBetween(
  double startLatitude,
  double startLongitude,
  double endLatitude,
  double endLongitude,
) {
  var earthRadius = 6378137.0;
  var dLat = _toRadians(endLatitude - startLatitude);
  var dLon = _toRadians(endLongitude - startLongitude);

  var a = pow(sin(dLat / 2), 2) +
      pow(sin(dLon / 2), 2) *
          cos(_toRadians(startLatitude)) *
          cos(_toRadians(endLatitude));
  var c = 2 * asin(sqrt(a));

  return earthRadius * c;
}

double _toRadians(double degree) {
  return degree * pi / 180;
}
