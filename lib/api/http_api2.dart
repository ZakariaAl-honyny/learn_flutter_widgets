import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpApi2 extends StatefulWidget {
  const HttpApi2({super.key});

  @override
  State<HttpApi2> createState() => _HttpApi2State();
}

class _HttpApi2State extends State<HttpApi2> {
  bool isLoading = false; // Track loading state
  // List<dynamic>? data; // Use nullable type to avoid null safety issues
  List<dynamic> data = [];

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
      return jsonResponse;
    } else {
      debugPrint('Request failed with status: ${response.statusCode}.');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http and API'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0, // Remove shadow
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            child: MaterialButton(
              textColor: Colors.black,
              onPressed: () async {
                setState(() {
                  isLoading = true; // Set loading state to true
                });
                data.clear(); // Clear previous data
                debugPrint('Fetching data from API...');
                data.addAll(await getDataFromAPI());
                setState(() {
                  isLoading = false; // Set loading state to false
                });
                debugPrint('Data received: $data');
              },

              color: Colors.blue,
              child: Text('Http Request'),
            ),
          ),
          if (isLoading) const Center(child: CircularProgressIndicator()),
          ...List.generate(data.length, (index) {
            final item = data[index];
            return Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 8.0,
              ),

              child: ListTile(
                title: Text(
                  'title: ${item['title']}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                subtitle: Text(
                  'body: ${item['body']}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ),
              ),
            );
          }),
          // ListView.builder(
          //   itemCount: data?.length ?? 0,
          //   itemBuilder: (context, index) {
          //     final item = data![index];
          //     return ListTile(
          //       textColor: Colors.black,
          //       title: Text(item['title']),
          //       subtitle: Text(item['body']),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
