import 'package:flutter/material.dart';

class ListviewGernerate extends StatefulWidget {
  const ListviewGernerate({super.key});

  @override
  State<ListviewGernerate> createState() => _ListviewGernerateState();
}

class _ListviewGernerateState extends State<ListviewGernerate> {
  List<Map<String, dynamic>> ListView_generate = [
    {'name': 'Zakaria', 'age': 22},
    {'name': 'Ahmed', 'age': 42},
    {'name': 'Mohammed', 'age': 54},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView.generate widget')),
      body: Container(
        margin: EdgeInsets.all(20),
        child: ListView(
          children: [
            ...List.generate(
              ListView_generate.length,
              (index) => Card(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                child: Text(
                  ListView_generate[index]['name'],
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),

            ...List.generate(
              20,
              (index) =>
                  Card(child: Text('$index', style: TextStyle(fontSize: 30))),
            ),
          ],
        ),
      ),
    );
  }
}
