import 'package:flutter/material.dart';

class CheckboxCheckboxlisttileWidget extends StatefulWidget {
  const CheckboxCheckboxlisttileWidget({super.key});

  @override
  State<CheckboxCheckboxlisttileWidget> createState() =>
      _CheckboxCheckboxlisttileWidgetState();
}

class _CheckboxCheckboxlisttileWidgetState
    extends State<CheckboxCheckboxlisttileWidget> {
  bool? programming = false;
  bool? problemSolving = false;
  bool? soccer = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckBox VS CheckBoxListTile'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Choose Your Favorite hobby?', style: TextStyle(fontSize: 25)),
          CheckboxListTile(
            title: Text('Programming'),
            activeColor: Colors.amber,
            value: programming,
            onChanged: (value) {
              setState(() {
                programming = value;
              });
              debugPrint('Programming: $value');
            },
          ),
          CheckboxListTile(
            title: Text('Problem Solving'),
            activeColor: Colors.amber,
            value: problemSolving,
            onChanged: (value) {
              setState(() {
                problemSolving = value;
              });
              debugPrint('Problem Solving: $value');
            },
          ),
          CheckboxListTile(
            title: Text('Soccer'),
            activeColor: Colors.amber,
            value: soccer,
            onChanged: (value) {
              setState(() {
                soccer = value;
              });
              debugPrint('Soccer: $value');
            },
          ),
        ],
      ),
    );
  }
}
