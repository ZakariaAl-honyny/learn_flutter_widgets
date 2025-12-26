import 'package:flutter/material.dart';

class ListviewWidget extends StatefulWidget {
  const ListviewWidget({super.key});

  @override
  State<ListviewWidget> createState() => _ListviewWidgetState();
}

class _ListviewWidgetState extends State<ListviewWidget> {
  final List employees = [
    {'name': 'Zakaria', 'age': 22},
    {'name': 'Ahamed', 'age': 34},
    {'name': 'Zakaria', 'age': 22},
    {'name': 'Murad', 'age': 28},
    {'name': 'Ahamed', 'age': 34},
    {'name': 'Zakaria', 'age': 22},
    {'name': 'Murad', 'age': 28},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ListView and ListView.builder and ListView.separated Widget',
        ),
      ),
      body: SizedBox(
        height: 400,
        child: ListView.separated(
          //physics: NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) {
            return Divider(color: Colors.black, height: 50);
          },
          scrollDirection: Axis.vertical,
          itemCount: employees.length,
          itemBuilder:
              (context, index) => Container(
                color: index.isEven ? Colors.cyan.shade900 : Colors.red,
                alignment: Alignment.center,
                width: 200,
                height: 200,
                child: Text(
                  employees[index]['name'],
                  style: TextStyle(color: Colors.white, fontSize: 25),
                  // children: [
                  //   Container(child: Text(employees[0]['name'])),
                  //   Container(child: Text(employees[1]['name'])),
                  //   Container(child: Text(employees[2]['name'])),
                  // ],
                ),
              ),
        ),
      ),
    );
  }
}
