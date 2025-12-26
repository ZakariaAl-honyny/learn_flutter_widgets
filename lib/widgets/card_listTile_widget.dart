import 'package:flutter/material.dart';

class CardListtileWidget extends StatelessWidget {
  const CardListtileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Card and ListTile')),
      body: ListView(
        children: [
          Card(
            color: Colors.white,
            child: ListTile(
              title: Text('Zakaria'),
              subtitle: Text('age: 22'),
              leading: Icon(Icons.person, color: Colors.brown, size: 10,),
              trailing: Icon(Icons.add),
              onTap: () {
                debugPrint('on tap');
              },
              onLongPress: () {
                debugPrint('on Long Press');
              },
            ),
          ),
          ListTile(
            title: Text('Zakaria'),
            subtitle: Text('age: 22'),
            leading: Icon(Icons.person),
            trailing: Icon(Icons.add),
            onTap: () {
              debugPrint('on tap');
            },
            onLongPress: () {
              debugPrint('on Long Press');
            },
          ),
        ],
      ),
    );
  }
}
