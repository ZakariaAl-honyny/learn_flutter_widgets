import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpApi extends StatelessWidget {
  const HttpApi({super.key});

  List getDataFromAPI() {
    // Uri.parse(uri);
    // json.decode(source);
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Http and API')),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            child: MaterialButton(
              onPressed: () async {
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
                int itemCount = 0;
                if (response.statusCode == 200) {
                  jsonResponse = jsonDecode(response.body) as List<dynamic>;
                  itemCount = jsonResponse.length;
                  debugPrint('Response body: ${response.body}');
                  debugPrint('Response type: ${response.runtimeType}.');
                  debugPrint('Request successful.');
                  debugPrint('Response status: ${response.statusCode}.');
                  debugPrint(jsonResponse[0].toString());
                  debugPrint('title: ${jsonResponse[0]['title']}');
                  debugPrint('Number of users about http: $itemCount.');
                } else {
                  debugPrint(
                    'Request failed with status: ${response.statusCode}.',
                  );
                }
              },

              color: Colors.blue,
              child: Text('Http Request'),
            ),
          ),
        ],
      ),
    );
  }
}
