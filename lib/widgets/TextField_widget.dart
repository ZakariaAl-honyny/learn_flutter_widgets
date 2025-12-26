import 'package:flutter/material.dart';

class TextfieldWidget extends StatefulWidget {
  const TextfieldWidget({super.key});

  @override
  State<TextfieldWidget> createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextfieldWidget> {
  TextEditingController username = TextEditingController();
  String? textFieldValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TextField')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                label: Text('First Name'),
                labelStyle: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                //prefixIcon: Icon(Icons.person),
                //prefixIconColor: Colors.red,
                icon: Icon(Icons.person),
                prefixText: 'Zakaria',
                border: UnderlineInputBorder(),
                // label: Text('UserName'),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: username,
              onChanged: (value) {
                setState(() {
                  textFieldValue = value;
                });
                debugPrint(value);
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                label: Text('username'),
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 3),
                ),
              ),
            ),
            Text('$textFieldValue'),
          ],
        ),
      ),
    );
  }
}
