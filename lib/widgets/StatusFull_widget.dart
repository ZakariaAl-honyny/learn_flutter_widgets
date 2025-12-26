import 'package:flutter/material.dart';

class StatusfullWidget extends StatefulWidget {
  const StatusfullWidget({super.key});

  @override
  State<StatusfullWidget> createState() => _StatusfullWidgetState();
}

class _StatusfullWidgetState extends State<StatusfullWidget> {
  int i = 0;
  bool satetus = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stateless vs SateFull')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  i++;
                  satetus = true;
                });

                debugPrint('add');
              },
              icon: Icon(Icons.add),
            ),
            satetus ? Icon(Icons.star) : Icon(Icons.star_border_outlined),
            Text('Counter:  $i'),
            IconButton(
              onPressed: () {
                setState(() {
                  i--;
                  satetus = false;
                });

                debugPrint('remove');
              },
              icon: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
