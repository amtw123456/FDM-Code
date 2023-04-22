import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _responseBody = '';

  Future<void> apicall() async {
    http.Response response;
    response = await http.get(Uri.parse("http://127.0.0.1:8000/notes/"));
    setState(() {
      _responseBody = response.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                apicall();
              },
              child: Text('Call API'),
            ),
            SizedBox(height: 20),
            Text(_responseBody),
          ],
        ),
      ),
    );
  }
}
