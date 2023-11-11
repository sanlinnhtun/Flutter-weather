import 'package:flutter/material.dart';
import 'package:weather/pages/city.dart';
import 'package:weather/pages/location.dart';

class MyHOmePage extends StatefulWidget {
  const MyHOmePage({super.key});

  @override
  State<MyHOmePage> createState() => _MyHOmePageState();
}

class _MyHOmePageState extends State<MyHOmePage> {

  // ignore: non_constant_identifier_names
  List<BottomNavigationBarItem> BottomNavigaBarList= [

    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home"
    ),

    const BottomNavigationBarItem(
      icon: Icon(Icons.location_pin),
      label: "Location"
    ),
  ];

  List<Widget> bodyWidget=[
    const CityPage(),
    const LocationPage(),
  ];

  int _selectedIndex=0;

  late TabController tabController;

  void onItemTap(int index) {
    setState(() {
      _selectedIndex=index;
    });
  }

  //  bool isCity = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Weather app"),
        ),
        // actions: [IconButton(onPressed: () {
        //   setState(() {
        //     isCity = !isCity;
        //   });
        //   print(isCity);
        // }, icon: Icon(Icons.location_on))],
      ),
      // body: isCity ? const CityPage(): const LocationPage(),
      body: bodyWidget[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        onTap: onItemTap,
        currentIndex: _selectedIndex,
        items: BottomNavigaBarList,
        ),
    );
  }
}
