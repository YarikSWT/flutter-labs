import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//

class AddPostScreen extends StatefulWidget {
  /// make the screen introduce it self
  static getRoute(BuildContext context) {
    return PageRouteBuilder(
        transitionsBuilder: (_, animation, secondAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: RotationTransition(
              turns: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
              child: child,
            ),
          );
        }, pageBuilder: (_, __, ___) {
      return new AddPostScreen();
    });
    // return MaterialPageRoute(builder: (_) => AddPostScreenTemplate());
  }

  const AddPostScreen({Key? key}) : super(key: key);

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new comment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                icon: Icon(Icons.title),
                filled: true,
                hintText: 'write title here...',
                labelText: 'title ',
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(
                icon: Icon(Icons.document_scanner),
                filled: true,
                hintText: 'write body here...',
                labelText: 'body ',
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                addComment(title: titleController.text, body: bodyController.text);
              },
              child: Text("Add Comment".toUpperCase()),
            )
          ],
        ),
      ),
    );
  }

  addComment({required String title,
    required String body}) async {
    var response = await http.post(
        Uri.parse(
            'https://jsonplaceholder.typicode.com/posts'
        ),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "title": "$title",
          "body": "$body",
        }));

    print(response.body);
    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Comment Added')));
    } else
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error ${response.body}')));
  }
}