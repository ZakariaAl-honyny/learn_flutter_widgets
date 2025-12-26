import 'package:flutter/material.dart';

class GridviewWidget extends StatefulWidget {
  const GridviewWidget({super.key});

  @override
  State<GridviewWidget> createState() => _ListviewWidgetState();
}

class _ListviewWidgetState extends State<GridviewWidget> {
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
          'GridView and GridView.builder and GridView.count Widget',
        ),
      ),
      body: SizedBox(
        height: 400,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.0, // height / width == new height
            mainAxisExtent: 200, // const height for Gridview
          ),
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
