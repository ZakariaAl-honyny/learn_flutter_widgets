import 'package:flutter/material.dart';

class Showbottomsheet extends StatefulWidget {
  const Showbottomsheet({super.key});

  @override
  State<Showbottomsheet> createState() => _ShowbottomsheetState();
}

class _ShowbottomsheetState extends State<Showbottomsheet> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: Text('Show Bottom Sheet')),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            scaffoldKey.currentState!.showBottomSheet(
              (context) => SizedBox(
                width: 1000,
                height: 200,
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Text('Zakaria Alhonyny'),
                    Text('Zakaria Alhonyny'),
                    Text('Zakaria Alhonyny'),
                    Text('Zakaria Alhonyny'),
                    Text('Zakaria Alhonyny'),
                    Text('Zakaria Alhonyny'),
                  ],
                ),
              ),
              backgroundColor: Colors.amber,
            );
          },
          textColor: Colors.white,
          color: Colors.red,
          child: Text('Show'),
        ),
      ),
    );
  }
}
