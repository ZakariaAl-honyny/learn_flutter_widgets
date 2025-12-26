import 'package:flutter/material.dart';

class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Responsive and Expaneded')),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(color: Colors.deepOrange, height: 100),
          ),
          Expanded(child: Container(color: Colors.green, height: 100)),
          Expanded(child: Container(color: Colors.yellow, height: 100)),
        ],
      ),
    );
  }
}
