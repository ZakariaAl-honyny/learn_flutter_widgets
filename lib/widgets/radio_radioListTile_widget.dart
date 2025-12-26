import 'package:flutter/material.dart';

class RadioRadiolisttileWidget extends StatefulWidget {
  const RadioRadiolisttileWidget({super.key});

  @override
  State<RadioRadiolisttileWidget> createState() =>
      _RadioRadiolisttileWidgetState();
}

class _RadioRadiolisttileWidgetState extends State<RadioRadiolisttileWidget> {
  String? radioGroupValue = 'Country';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Radio VS RadioListTile')),
      body: Column(
        children: [
          Text('Choose Your Country?', style: TextStyle(fontSize: 30)),
          RadioListTile(
            title: Text('Yemen'),
            tileColor: Colors.amberAccent,
            value: 'Yemen',
            groupValue: radioGroupValue,
            onChanged: (value) {
              setState(() {
                radioGroupValue = value;
              });
              debugPrint(value);
            },
          ),
          RadioListTile(
            title: Text('Jorden'),
            subtitle: Text('data'),

            activeColor: Colors.red,
            tileColor: Colors.green,
            value: 'Jorden',
            groupValue: radioGroupValue,
            onChanged: (value) {
              setState(() {
                radioGroupValue = value;
              });
              debugPrint(value);
            },
          ),
          RadioListTile(
            title: Text('Egept'),
            tileColor: Colors.blue,
            value: 'Egept',
            groupValue: radioGroupValue,
            onChanged: (value) {
              setState(() {
                radioGroupValue = value;
              });
              debugPrint(value);
            },
          ),

          Text(
            'Your Country is $radioGroupValue',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
