import 'package:flutter/material.dart';

class PopupmenubuttonWidget extends StatelessWidget {
  const PopupmenubuttonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupMenuButton Widget'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          PopupMenuButton(
            color: Colors.white,
            onOpened: () => debugPrint('Opened'),
            onCanceled: () => debugPrint('Canceled'),
            onSelected: (value) {
              if (value == 'Option two') {
                debugPrint(value);
              } else {
                debugPrint(value);
              }
            },
            itemBuilder:
                (context) => [
                  PopupMenuItem(
                    value: 'Option one',
                    child: Text(
                      'Option one',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'Option two',
                    child: Text(
                      'Option two',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
          ),
        ],
      ),
      body: Container(),
    );
  }
}
