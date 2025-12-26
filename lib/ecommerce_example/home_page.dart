import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.blueAccent,
                        ),
                        hintText: 'Search',

                        hintStyle: TextStyle(height: 2),
                        hintTextDirection: TextDirection.ltr,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.menu),
                ],
              ),

              SizedBox(height: 30),
              Text('Categories', style: TextStyle(fontSize: 16)),
              SizedBox(height: 20),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                            color: Colors.grey.shade200,
                          ),
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: 70,
                          height: 70,
                          child: Icon(Icons.chair, size: 30),
                        ),
                        Text(
                          'Chair',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                            color: Colors.grey.shade200,
                          ),
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: 70,
                          height: 70,
                          child: Icon(Icons.collections_sharp, size: 30),
                        ),
                        Text(
                          'Images',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                            color: Colors.grey.shade200,
                          ),
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: 70,
                          height: 70,
                          child: Icon(Icons.card_travel, size: 30),
                        ),
                        Text(
                          'Bagges',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                            color: Colors.grey.shade200,
                          ),
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: 70,
                          height: 70,
                          child: Icon(Icons.home, size: 40),
                        ),
                        Text(
                          'House',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),

                        SizedBox(width: 10),
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                            color: Colors.grey.shade200,
                          ),
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: 70,
                          height: 70,
                          child: Icon(Icons.mobile_friendly, size: 40),
                        ),
                        Text(
                          'Mobile',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),

                        SizedBox(width: 10),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 300,
                width: 200,
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),

                  children: [Card(color: Colors.white, child: Text('zakaria'))],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
