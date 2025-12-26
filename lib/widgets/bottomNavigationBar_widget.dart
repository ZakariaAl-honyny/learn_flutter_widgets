import 'package:flutter/material.dart';

class BottomnavigationbarWidget extends StatefulWidget {
  const BottomnavigationbarWidget({super.key});

  @override
  State<BottomnavigationbarWidget> createState() =>
      _BottomnavigationbarWidgetState();
}

class _BottomnavigationbarWidgetState extends State<BottomnavigationbarWidget> {
  int tabIndex = 0;

  List<Widget> listOfWidgets = [
    Text('Page 1', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
    Text('Page 2', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BottomVavigationBar Widget')),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIndex,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(fontSize: 20),
        unselectedItemColor: Colors.black,
        onTap: (value) {
          setState(() {
            tabIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            tooltip: 'Home Page',
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      body: listOfWidgets[tabIndex],
    );
  }
}
