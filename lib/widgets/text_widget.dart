import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("text", style: TextStyle(fontSize: 50)),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                "Zakaria Alhonyny",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.amber,
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: Colors.red,
                textColor: Colors.white,
                child: Text('Pop'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
