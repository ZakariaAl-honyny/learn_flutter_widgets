import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {

  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final GlobalKey<DrawerControllerState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      appBar: AppBar(backgroundColor: Colors.blue, title: Text('data')),
      drawer: Drawer(backgroundColor: Colors.amber),
      body: ListTile(),
    );
  }
}
