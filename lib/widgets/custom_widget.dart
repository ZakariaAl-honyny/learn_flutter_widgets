
import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Widget', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          
          children: [
            Card(
              child: Column(
                children: [
                  MyCustomCard(
                    title: 'Zakaria',
                    email: 'Zakaria@gmail.com',
                    date: '2025-5-26',
                    imagePath: 'photo.jpg',
                  ),
                  SizedBox(height: 10),
                  MyCustomCard(
                    title: 'Zakaria',
                    email: 'Zakaria@gmail.com',
                    date: '2025-5-26',
                    imagePath: 'photo.jpg',
                  ),
                  SizedBox(height: 10),
                  MyCustomCard(
                    title: 'Zakaria',
                    email: 'Zakaria@gmail.com',
                    date: '2025-5-26',
                    imagePath: 'photo.jpg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCustomCard extends StatelessWidget {
  final String title;
  final String email;
  final String date;
  final String imagePath;
  const MyCustomCard({
    super.key,
    required this.title,
    required this.email,
    required this.date,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: 70,
              height: 70,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(70)),
                child: Image.asset(
                  'images/$imagePath',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  title,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                subtitle: Text(
                  email,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                trailing: Text(
                  date,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
