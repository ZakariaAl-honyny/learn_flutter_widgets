import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('image widget')),
      body: SizedBox(
        width: 300,
        height: 300,
        // child: Image.network(
        //   'https://images.pexels.com/photos/1563356/pexels-photo-1563356.jpeg',
        // ),
        child: Image.asset(
          'images/instagram_96px.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
