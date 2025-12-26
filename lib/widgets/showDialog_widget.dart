import 'package:flutter/material.dart';

class ShowdialogWidget extends StatelessWidget {
  const ShowdialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ShowDialog'), backgroundColor: Colors.blue),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return AlertDialog(
                  icon: Icon(Icons.warning, color: Colors.yellow),
                  title: Text('warning'),
                  content: Text('Are you sure?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        debugPrint('Ok');
                        Navigator.of(context).pop();
                      },
                      child: Text('Ok', style: TextStyle(color: Colors.cyan)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.cyan),
                      ),
                    ),
                  ],
                );
              },
            );
          },
          color: Colors.red,
          textColor: Colors.white,
          child: Text('Show Alert'),
        ),
      ),
    );
  }
}
