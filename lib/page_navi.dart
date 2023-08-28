import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geolocator/geolocator.dart';
import 'package:oshigamimeguri/background.dart';
import 'package:oshigamimeguri/google_map_page.dart';
import 'package:oshigamimeguri/my_colors.dart';
import 'package:oshigamimeguri/page_ema.dart';
import 'package:oshigamimeguri/page_home.dart';
import 'package:oshigamimeguri/page_serch.dart';

class PageNavi extends HookWidget {
  const PageNavi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final selectPageId = useState(0);

    final pages = [
      const Home(),
      Ema(),
      const Search(),
    ];

    final items = [
      BottomNavigationBarItem(
        icon: Image.asset('images/home.png', height: 40, width: 40),
        label: "",
        backgroundColor: Colors.yellow,
      ),
      BottomNavigationBarItem(
          icon: Image.asset('images/ema.png', height: 40, width: 40),
          label: ""),
      BottomNavigationBarItem(
          icon: Image.asset('images/search.png', height: 40, width: 40),
          label: ""),
    ];

    final bar = BottomNavigationBar(
      items: items,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.yellow,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
      currentIndex: selectPageId.value,
      onTap: (index) {
        selectPageId.value = index;
      },
    );

    return Scaffold(
      body: Stack(
        children: [
          const Background(),
          pages[selectPageId.value],
          Container(
            alignment: Alignment(0, 0.9),
            child: Container(
              height: screenSize.height * 0.13,
              width: screenSize.width * 0.85,
              decoration: BoxDecoration(
                border: Border.all(color: MyColors.primary, width: 6),
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: MyColors.secondary,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    splashColor: Colors.cyanAccent,
                    onTap: () {
                      selectPageId.value = 0;
                    },
                    child: Container(
                      width: screenSize.width * 0.15,
                      height: screenSize.width * 0.15,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/home.png')),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.cyanAccent,
                    onTap: () {
                      selectPageId.value = 1;
                    },
                    child: Container(
                      width: screenSize.width * 0.15,
                      height: screenSize.width * 0.15,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/ema.png')),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.cyanAccent,
                    onTap: () {
                      selectPageId.value = 2;
                    },
                    child: Container(
                      width: screenSize.width * 0.15,
                      height: screenSize.width * 0.15,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/search.png')),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
