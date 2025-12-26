import 'package:flutter/material.dart';

class RowColumnWidget extends StatelessWidget {
  const RowColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Row and Column Widget')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Zakria',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Image.asset('images/photo.jpg', width: 100, height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.home, size: 50, color: Colors.blue),
              Icon(Icons.search, size: 50, color: Colors.green),
              Icon(Icons.settings, size: 50, color: Colors.red),
            ],
          ),
        ],
      ),
    );
  }
}
