import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stack Widget')),
      body: Stack(
        alignment: Alignment(1, 1),
        clipBehavior: Clip.none, // show widget that is out of container
        children: [
          Container(width: 300, height: 300, color: Colors.red),
          Container(width: 200, height: 200, color: Colors.green),
          Positioned(
            right: -20,
            bottom: -30,
            child: Container(width: 100, height: 100, color: Colors.blue),
          ),
          Positioned(
            left: 50,
            top: 50,
            child: Text('Zakaria', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
