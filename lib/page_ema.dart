import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Ema extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Firestore with Riverpod')),
        body: DataFetcher(),
      ),
    );
  }
}

final shrineProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('shrines').get();
  return snapshot.docs
      .map((doc) => doc.data() as Map<String, dynamic>)
      .toList();
});

class DataFetcher extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(shrineProvider).when(
          data: (shrineData) {
            return ListView.builder(
              itemCount: shrineData.length,
              itemBuilder: (context, index) {
                // ここで,dataにshrineCenterの型をつけてあげてもいい
                final data = shrineData[index];
                print(data);
                // ここでは `name` というフィールドを仮定しています。
                return ListTile(
                    title: Text(data["lat"].toString() ?? 'Unknown'));
              },
            );
          },
          loading: () => Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(child: Text('Error: $error')),
        );
  }
}

//クラス名
class shrineCenter {
  // List<double> shrineLatList = [];
  // List<double> shrineLngList = [];
  final String explanatin;
  final String nama;
  final String hiraNama;
  final String name;
  final double lat;
  final double lng;

  shrineCenter(
      {required this.explanatin,
      required this.nama,
      required this.hiraNama,
      required this.name,
      required this.lat,
      required this.lng});
}

// class Shrine{
  

//   String shrineName;

//   Shrine({
//     required this.shrineName,
//   })
  
// }



//   final shrineCollection = await FirebaseFirestore.instance.collection('shrine').get;
  
  


// if()



// class Memo {
//   String id;
//   String title;
//   String detail;
//   Timestamp createdDate;
//   Timestamp? updatedDate;

//   Memo({
//     required this.id,
//     required this.title,
//     required this.detail,
//     required this.createdDate,
//     this.updatedDate,
//   });
// }
