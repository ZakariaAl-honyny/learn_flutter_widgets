import 'package:flutter/material.dart';

class IconIconbottonWidget extends StatelessWidget {
  const IconIconbottonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Icon and IconBotton')),
      body: Column(
        children: [
          Icon(
            Icons.star,
            color: const Color.fromRGBO(255, 193, 7, 1),
            size: 50,
          ),
          IconButton(
            iconSize: 100,
            color: Colors.blue,
            onPressed: () {
              debugPrint('on pressed Icon');
            },
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
