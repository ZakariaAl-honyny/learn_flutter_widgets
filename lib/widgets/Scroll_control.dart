import 'package:flutter/material.dart';

class ScrollControl extends StatefulWidget {
  const ScrollControl({super.key});

  @override
  State<ScrollControl> createState() => _ScrollControlState();
}

class _ScrollControlState extends State<ScrollControl> {
  late ScrollController? scrollController;

  @override
  void initState() {
    scrollController = ScrollController();

    scrollController!.addListener(() {
      debugPrint('${scrollController!.offset}');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white10,
        focusColor: Colors.black,
        onPressed: () {
          scrollController!.animateTo(
            0,
            duration: Duration(seconds: 2),
            curve: Curves.ease,
          );
        },
        child: Icon(Icons.arrow_upward),
      ),
      appBar: AppBar(title: Text('Control of Scrooll Page')),
      body: ListView(
        controller: scrollController,
        children: [
          MaterialButton(
            textColor: Colors.black,
            color: Colors.amber,
            onPressed: () {
              scrollController!.jumpTo(7492);
            },
            child: Text('Go to Bottom'),
          ),
          ...List.generate(100, (index) {
            return Container(
              color: index.isEven ? Colors.red : Colors.green,
              padding: EdgeInsets.all(30),
              child: Center(child: Text('$index')),
            );
          }),

          MaterialButton(
            textColor: Colors.black,
            color: Colors.amber,
            onPressed: () {
              scrollController!.jumpTo(0);
            },
            child: Text('Go to Front'),
          ),
        ],
      ),
    );
  }
}
