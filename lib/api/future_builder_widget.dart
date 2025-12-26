// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FutureBuilderWidget extends StatefulWidget {
  const FutureBuilderWidget({super.key});

  @override
  State<FutureBuilderWidget> createState() => _FutureBuilderWidgetState();
}

class _FutureBuilderWidgetState extends State<FutureBuilderWidget> {
  Future<List<dynamic>> getDataFromAPI() async {
    var response = http.Response('', 404); // Initialize response
    // Use try-catch to handle potential errors during the HTTP request.
    try {
      var url = Uri.https('jsonplaceholder.typicode.com', '/posts', {
        'userId': '1',
      });

      // Await the http get response, then decode the json-formatted response.
      response = await http.get(url);
    } catch (e) {
      debugPrint('Error occurred: $e');
    }
    List<dynamic> jsonResponse = [];
    if (response.statusCode == 200) {
      jsonResponse = jsonDecode(response.body) as List<dynamic>;

      debugPrint('Request successful.');
      debugPrint('Response status: ${response.statusCode}.');
    } else {
      debugPrint('Request failed with status: ${response.statusCode}.');
    }
    return jsonResponse;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FutureBuilder Widget'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0, // Remove shadow
      ),
      body: FutureBuilder<List<dynamic>>(
        future: getDataFromAPI(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While the future is still loading, show a loading indicator.
            debugPrint('Loading data...');
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // If the future has an error, display the error message.
            debugPrint('Error: ${snapshot.error}');
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // If the future completes with no data, show a message.
            debugPrint('No data found.');
            return const Center(child: Text('No data found.'));
          } else {
            // When the future is complete and has data, build the list view.
            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return ListTile(
                  title: Text(item['title']),
                  subtitle: Text(item['body']),
                );
              },
            );
          }
        },
      ),
    );
  }
}
