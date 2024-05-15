import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:recipe_finder/pages/favorites.dart';
import 'package:recipe_finder/pages/search_recipe.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

 late StreamSubscription subscription;
  int currentIndex = 0;
  List pages = [
    const SearchRecipe(),
    const FavoriteRecipe(),
  ];
  Future<void> initConnectivity() async {
    subscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) {
      if (result.contains(ConnectivityResult.none)) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No internet connection')));
      }
      // Received changes in available connectivity types!
    });

    if (!mounted) {
      return;
    }


  }


  @override
  void initState() {
    initConnectivity();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: pages.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {

          });
          currentIndex = index;
        },
        items:  const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
          label: "Home"
          ),
          BottomNavigationBarItem(
          label: "Favorites",
              icon: Icon(Icons.favorite_outline_outlined))
        ],
      ),
    );
  }

@override
  void dispose() {
 subscription.cancel();
    super.dispose();
  }

}