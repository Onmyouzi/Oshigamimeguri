import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:oshigamimeguri/ShrineCard.dart';
import 'package:oshigamimeguri/shrine_cetner.dart';

class Search extends HookWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final db = FirebaseFirestore.instance;
    final shrines = useState<List<shrineCenter>>([]);

    Future fetchShrines() async {
      final shrineDocs = await db.collection('shrines').get();
      shrines.value = shrineDocs.docs
          .map((doc) => shrineCenter.fromJson(doc.data()))
          .toList();
    }

    useEffect(() {
      fetchShrines();
      return;
    }, []);

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
            child: Column(
              children: [
                for (final shrine in shrines.value) ShrineCard(shrine: shrine),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
