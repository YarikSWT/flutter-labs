// import '../courses_codes/Labs/Lab4/AddPostScreen.dart';
// import '../courses_codes/templates/Lab4/AddPostScreen.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Post.dart';
import 'AddPostScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.teal,
              accentColor: Colors.blueGrey)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool change = true;
  List<Post> posts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Posts List"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, AddPostScreen.getRoute(context));
          },
          child: Icon(Icons.add_comment_sharp),
        ),
        body: buildEmptyView()
    );
  }

  Widget buildEmptyView() {
    return FutureBuilder<List<Post>>(
        future: getPosts(),
        builder: (context, snapshot) {
          // on Error
          if (snapshot.hasError) {
            return Text("Error");
          }
          // on Finish
          if (snapshot.connectionState == ConnectionState.done) {
            posts = snapshot.data!;
            return buildUserList();
          }

          return Center(child: CircularProgressIndicator());
        });
    }

  Future<List<Post>> getPosts() async {
     List<Post> postList =[];
    ///Exercise 1 call API here
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      body.forEach((json) {
        postList.add(Post.fromJson(json));
      });
      print(postList);
      return postList;
    }
    return [];
  }

  buildUserList() {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(Duration(seconds: 5), () {});
      },
      child: RefreshIndicator(
        onRefresh: () {
          return Future.value(true);
        },
        child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(Icons.message),
                title: Text("${posts[index].title}"),
                subtitle: Text("${posts[index].body}"),
              );
            }),
      ),
    );
  }
}