import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:oshigamimeguri/my_colors.dart';

class Ema extends ConsumerWidget {
  //神社の座標を取得する
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double _deviceWidth = MediaQuery.of(context).size.width;
    final double _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(body: DataFetcher());
  }
}

final locationProvider = FutureProvider((ref) async {
  return await determinePosition();
});

final locationStreamProvider =
    StreamProvider((ref) => Geolocator.getPositionStream());

final shrineProvider = FutureProvider<List<shrineCenter>>((ref) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('shrines').get();

  return snapshot.docs
      .map(
          (doc) => doc.data() as Map<String, dynamic>) // List<Map<index, data>>
      .map((shrine) => shrineCenter(
          lat: shrine['lat'],
          lng: shrine['lng'],
          imageName: shrine['imageName'].toString(),
          explanation: shrine["explanation"].toString(),
          godID: shrine['godID'].toString(),
          name: shrine['name'].toString(),
          hiraName: shrine['hiraName'].toString())) // List<List<data>>
      .toList();
});

final visitedShrineStateProvider =
    StateProvider<List<shrineCenter>>((ref) => []);

class DataFetcher extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double _deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    final startPosition = ref.watch(locationProvider);
    final shrineData = ref.watch(shrineProvider);
    // 現在の神社と過去の神社を保存する場所
    final visitedState = ref.watch(visitedShrineStateProvider);
    final visitedNotifier = ref.read(visitedShrineStateProvider.notifier);

    // 現在位置のデータがロードされているか確認
    if (startPosition is AsyncData<Position>) {
      var currentPosition = ref.watch(locationStreamProvider);
      return shrineData.when(
        data: (shrineData) {
          return currentPosition.when(
            data: (position) {
              //
              final filterdShrindata = _filterPositionsByDistance(
                  shrineData, position.latitude, position.longitude);
              final currentState = visitedState;
              final updatedShrineState =
                  (currentState + filterdShrindata).toSet().toList();
              print(updatedShrineState);
              // visitedNotifier.state = updatedShrineState;

              return Scaffold(
                body: Column(
                  children: [
                    Container(
                      height: deviceHeight * 0.15,
                      color: Colors.amber,
                    ),
                    Container(
                      height: deviceHeight * 0.25,
                      color: const Color.fromARGB(255, 247, 242, 227),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/ema_title.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Text(
                        '${startPosition.value.latitude},${startPosition.value.longitude}'),
                    Container(
                      color: const Color.fromARGB(255, 247, 242, 227),
                      height: deviceHeight * 0.6,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemCount: (updatedShrineState.length),
                        itemBuilder: (context, index) {
                          final data = updatedShrineState[index];

                          return Card(
                            //UIをここに書いていく
                            color: Color.fromARGB(228, 205, 152, 103),
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(30), // 角の半径を設定
                                ),
                                height: 1000,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'images/' + data.imageName,
                                    ),
                                    Text(
                                        ' ${data.name} ${data.lat},${data.lng}'),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
            loading: () => Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error:')),
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error:')),
      );
    } else if (startPosition is AsyncError) {
      return Center(child: Text('Location Error:${startPosition.error}'));
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
  final String imageName;

  shrineCenter(
      {required this.explanation,
      required this.godID,
      required this.hiraName,
      required this.name,
      required this.lat,
      required this.lng,
      required this.imageName});
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

// latとlangから近い神社を取得する
List<shrineCenter> _filterPositionsByDistance(
    List<shrineCenter> shrine, double lat, double lng) {
  const double distanceThreshold = 100; // 100m

  return shrine.where((position) {
    // print('current: $lat,$lng shrine: ${position.lat},${position.lng}}');
    double distance = _distanceBetween(
      lat,
      lng,
      position.lat,
      position.lng,
    );
    // print(distance);
    return distance <= distanceThreshold;
  }).toList();
}

double _distanceBetween(
  double latitude1,
  double longitude1,
  double latitude2,
  double longitude2,
) {
  final double r = 6378137.0; // 地球の半径
  final double f1 = toRadians(latitude1);
  final double f2 = toRadians(latitude2);
  final double l1 = toRadians(longitude1);
  final double l2 = toRadians(longitude2);
  final num a = pow(sin((f2 - f1) / 2), 2);
  final double b = cos(f1) * cos(f2) * pow(sin((l2 - l1) / 2), 2);
  final double d = 2 * r * asin(sqrt(a + b));
  return d;
}

double toRadians(double degree) {
  return degree * pi / 180;
}
