import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.person),
        centerTitle: true,
        actionsPadding: EdgeInsets.all(10),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu, color: Colors.white),
          ),
        ],
        backgroundColor: Colors.blue,
        title: Text('data'),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
