import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpApi3 extends StatefulWidget {
  const HttpApi3({super.key});

  @override
  State<HttpApi3> createState() => _HttpApi3State();
}

class _HttpApi3State extends State<HttpApi3> {
  bool isLoading = true; // Track loading state
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

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as List<dynamic>;

      debugPrint('Request successful.');
      debugPrint('Response status: ${response.statusCode}.');
      data.addAll(jsonResponse);
    } else {
      debugPrint('Request failed with status: ${response.statusCode}.');
      data.clear();
    }
    setState(() {
      isLoading = false; // Update loading state
    });
    return data;
  }

  @override
  void initState() {
    getDataFromAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FutureBuilder Widget'),
        backgroundColor: const Color.fromARGB(255, 68, 71, 74),
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0, // Remove shadow
      ),
      body: ListView(
        children: [
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
