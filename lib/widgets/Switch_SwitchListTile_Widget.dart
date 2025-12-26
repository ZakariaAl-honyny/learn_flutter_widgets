import 'package:flutter/material.dart';

class SwitchSwitchlisttileWidget extends StatefulWidget {
  const SwitchSwitchlisttileWidget({super.key});

  @override
  State<SwitchSwitchlisttileWidget> createState() =>
      _SwitchSwitchlisttileWidgetState();
}

class _SwitchSwitchlisttileWidgetState
    extends State<SwitchSwitchlisttileWidget> {
  bool SwitchSatusValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Switch VS SwitchListTile')),
      body: Container(
        // width: 200,
        // height: 100,
        // color: const Color.fromARGB(255, 99, 99, 99),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SwitchListTile.adaptive(
              title: Text('Switch List Tile Title'),
              subtitle: Text('subtitle'),
              activeColor: Colors.amber,
              activeTrackColor: Colors.green,
              inactiveTrackColor: Colors.red,
              inactiveThumbColor: Colors.blue,

              value: SwitchSatusValue,
              onChanged: (value) {
                setState(() {
                  SwitchSatusValue = value;
                });
                debugPrint('on Change value: $value');
              },
            ),
          ],
        ),
      ),
    );
  }
}
