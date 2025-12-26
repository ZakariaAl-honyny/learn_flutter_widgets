import 'package:flutter/material.dart';

class PageviewPageviewbuilderWidget extends StatefulWidget {
  const PageviewPageviewbuilderWidget({super.key});

  @override
  State<PageviewPageviewbuilderWidget> createState() =>
      _PageviewPageviewbuilderWidgetState();
}

class _PageviewPageviewbuilderWidgetState
    extends State<PageviewPageviewbuilderWidget> {
  List<Widget> listOfTextWidgets = [
    Text(
      'Page 1',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w900,
        color: Colors.black,
      ),
    ),
    Text(
      'Page 2',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w900,
        color: Colors.black,
      ),
    ),
  ];
  List<Widget> listOfImageWidgets = [
    Image(image: AssetImage('images/photo.jpg'), fit: BoxFit.cover),
    Image(image: AssetImage('images/WelcomeScan.jpg'), fit: BoxFit.cover),
    Image(image: AssetImage('images/photo.jpg'), fit: BoxFit.cover),
    Image(image: AssetImage('images/WelcomeScan.jpg'), fit: BoxFit.cover),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PageView vs PageViewBuilder',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        height: 300,
        color: Colors.amber,
        padding: EdgeInsets.all(10),

        child: PageView.builder(
          reverse: true,
          itemCount: listOfImageWidgets.length,
          itemBuilder: (context, index) {
            return listOfImageWidgets[index];
          },
        ),
      ),
    );
  }
}
