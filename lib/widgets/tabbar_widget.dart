import 'package:flutter/material.dart';

class TabbarWidget extends StatefulWidget {
  const TabbarWidget({super.key});

  @override
  State<TabbarWidget> createState() => _TabbarWidgetState();
}

class _TabbarWidgetState extends State<TabbarWidget>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Tabbar'),
        bottom: TabBar(
          controller: tabController,
          labelColor: Colors.amber,
          indicatorColor: Colors.amber,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(10),
          indicatorWeight: 4.0,
          unselectedLabelColor: Colors.white,
          tabs: [
            Tab(icon: Icon(Icons.laptop), child: Text('Laptop')),
            Tab(icon: Icon(Icons.mobile_friendly), child: Text('Mobile')),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: TabBarView(
          controller: tabController,
          children: [
            Column(
              children: [
                Text('Laptop Page'),
                MaterialButton(
                  onPressed: () {
                    tabController!.animateTo(1);
                  },
                  color: Colors.blue,
                  child: const Text(
                    'Go to Mobile Page',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),

            Text('Mobile Page'),
          ],
        ),
      ),
    );
  }
}

//simple way to implement tabbar
// class _TabbarWidgetState extends State<TabbarWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blue,
//           title: Text('Tabbar'),
//           bottom: TabBar(
//             labelColor: Colors.amber,
//             indicatorColor: Colors.white,
//             indicatorPadding: EdgeInsets.all(10),
//             indicatorWeight: 4.0,
//             unselectedLabelColor: Colors.white,
//             tabs: [
//               Tab(icon: Icon(Icons.laptop), child: Text('Laptop')),
//               Tab(icon: Icon(Icons.mobile_friendly), child: Text('Mobile')),
//               Tab(icon: Icon(Icons.shop), child: Text('Store')),
//             ],
//           ),
//         ),
//         body: Container(
//           padding: EdgeInsets.all(10),
//           child: TabBarView(
//             children: [
//               Text('Laptop Page'),
//               Text('Mobile Page'),
//               Text('Store Page'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
