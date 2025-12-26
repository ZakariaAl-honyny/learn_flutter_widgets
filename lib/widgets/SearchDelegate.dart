import 'package:flutter/material.dart';

class Searchdelegate extends StatefulWidget {
  const Searchdelegate({super.key});

  @override
  State<Searchdelegate> createState() => _SearchdelegateState();
}

class _SearchdelegateState extends State<Searchdelegate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SearchDelegate Widget'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Container(),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> usernames = [
    'Zakaria',
    'Mohand',
    'Ahmed',
    'Mohammed',
    'Murad',
    'Ali',
  ];

  List<String>? filterUsername;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = ''; // query is contain the content for search
        },
        icon: Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('Results: $query');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return ListView.builder(
        itemCount: usernames.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              query = usernames[index];
              showResults(context);
            },
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(usernames[index], style: TextStyle(fontSize: 16.0)),
              ),
            ),
          );
        },
      );
    } else {
      filterUsername =
          usernames.where((element) => element.contains(query)).toList();
      return ListView.builder(
        itemCount: filterUsername!.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              query = filterUsername![index];
              showResults(context);
            },
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  filterUsername![index],
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
