import 'package:flutter/material.dart';

class SnackbarWidget extends StatefulWidget {
  const SnackbarWidget({super.key});

  @override
  State<SnackbarWidget> createState() => _SnackbarWidgetState();
}

class _SnackbarWidgetState extends State<SnackbarWidget> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Show SnackBar'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.amber,
                shape: Border.all(color: Colors.black),
                content: Text('Are you sure?'),
                action: SnackBarAction(
                  label: 'Ok',
                  backgroundColor: Colors.brown,
                  textColor: Colors.white,
                  onPressed: () {
                    debugPrint('Ok from snackBar');
                  },
                ),
              ),
            );
          },
          textColor: Colors.white,
          color: Colors.red,
          child: Text('Show'),
        ),
      ),
    );
  }
}
