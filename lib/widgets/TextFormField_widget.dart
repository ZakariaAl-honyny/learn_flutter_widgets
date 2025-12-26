import 'package:flutter/material.dart';

class TextformfieldWidget extends StatefulWidget {
  const TextformfieldWidget({super.key});

  @override
  State<TextformfieldWidget> createState() => _TextformfieldWidgetState();
}

class _TextformfieldWidgetState extends State<TextformfieldWidget> {
  final GlobalKey<FormState> _fromKey = GlobalKey();
  String? username;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('TextFormField Widget'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _fromKey,
          child: Column(
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.always,
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(label: Text('username')),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Text From Field is Empty";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  username = newValue;
                },
              ),
              MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () {
                  if (_fromKey.currentState!.validate()) {
                    _fromKey.currentState!.save();
                    print('valid');
                    print(username);
                  } else {
                    print('invalid');
                    print('username: $username');
                  }
                },
                child: Text('valid'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
