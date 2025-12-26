import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Container Widget')),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(1000)),
          border: Border.all(color: Colors.black, width: 10),
          boxShadow: [
            BoxShadow(
              color: Colors.red,
              offset: Offset(30, -20),
              spreadRadius: 2,
              blurRadius: 10,
            ),
            BoxShadow(
              color: Colors.blue,
              offset: Offset(10, -20),
              spreadRadius: 2,
              blurRadius: 10,
            ),
            BoxShadow(
              color: Colors.green,
              offset: Offset(-10, -20),
              spreadRadius: 2,
              blurRadius: 10,
            ),
          ],
        ),
        width: 300,
        height: 300, //double.infinity,
        alignment: Alignment.center,
        margin: EdgeInsets.all(50),
        padding: EdgeInsets.all(15),
        child: const Text(
          'Zakaria Abd-Alazziz',
          style: TextStyle(
            color: Colors.white,
            fontSize: 29,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
