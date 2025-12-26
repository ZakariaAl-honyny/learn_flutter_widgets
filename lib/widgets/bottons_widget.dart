//import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

import 'package:flutter/material.dart';

class BottonsWidget extends StatefulWidget {
  const BottonsWidget({super.key});

  @override
  State<BottonsWidget> createState() => _BottonsWidgetState();
}

class _BottonsWidgetState extends State<BottonsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('button widgets')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
          debugPrint(
            'Message from on Pressed Floating Action Button Function.',
          );
        },
        tooltip: 'Floating Action Button',
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        hoverColor: Colors.black,

        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            MaterialButton(
              color: Colors.white,
              // height: 20,
              // minWidth: 50,
              autofocus: false,
              padding: EdgeInsets.all(20),
              onLongPress: () {
                debugPrint(
                  'Message from on Long Pressed Material Button Function.',
                );
              },
              onPressed: () {
                debugPrint('Message from on Pressed Material Button Function.');
              },
              child: Text('M. Button'),
            ),
            IconButton(
              onPressed: () {
                debugPrint('Message from on Pressed Icon Button Function.');
              },
              icon: Icon(Icons.person),
              color: Colors.black,
              iconSize: 60,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('TextButton', style: TextStyle(color: Colors.cyan)),
            ),
            ElevatedButton(
              onPressed: () {
                // Action when button is pressed
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Button Pressed!')));
              },
              child: Text('Press Me'),
            ),
          ],
        ),
      ),
    );
  }
}
