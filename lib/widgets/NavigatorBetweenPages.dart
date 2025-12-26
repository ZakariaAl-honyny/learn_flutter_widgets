import 'package:flutter/material.dart';
import 'package:learn_flutter_widgets/widgets/text_widget.dart';

class Navigatorbetweenpages extends StatelessWidget {
  const Navigatorbetweenpages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigtor Types'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => TextWidget()));
              },
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Push'),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => TextWidget()),
                );
              },
              color: Colors.red,
              textColor: Colors.white,
              child: Text('pushReplacement'),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => TextWidget()),
                  (route) => false,
                );
              },
              color: Colors.red,
              textColor: Colors.white,
              child: Text('pushReplacement'),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed('TextWidget');
              },
              color: Colors.red,
              textColor: Colors.white,
              child: Text('pushNamed'),
            ),
          ],
        ),
      ),
    );
  }
}
