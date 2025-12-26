import 'package:flutter/material.dart';

class SingleChlidScroolViewWidget extends StatelessWidget {
  const SingleChlidScroolViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SingleChildScrollView widget')),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(color: Colors.red, width: 100, height: 100),
              Container(color: Colors.green, width: 100, height: 100),
              Container(color: Colors.blue, width: 100, height: 100),
              Container(color: Colors.red, width: 100, height: 100),
              Container(color: Colors.green, width: 100, height: 100),
              Container(color: Colors.blue, width: 100, height: 100),
              Container(color: Colors.red, width: 100, height: 100),
              Container(color: Colors.green, width: 100, height: 100),
              Container(color: Colors.blue, width: 100, height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
