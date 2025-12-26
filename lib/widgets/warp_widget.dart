import 'package:flutter/material.dart';

class WarpWidget extends StatelessWidget {
  const WarpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SingleChildScrollView widget')),
      body: Center(
        child: Wrap(
          verticalDirection: VerticalDirection.up,
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
    );
  }
}
