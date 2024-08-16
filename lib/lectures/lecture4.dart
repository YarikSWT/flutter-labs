import 'package:flutter/material.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Fredoka One'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.apple),
          title: Text('Flutter course'),
        ),
        body: BodyWidget(),
        floatingActionButton: FloatingActionButton(onPressed: ()=> {},)

    );
  }
}

Widget BodyWidget () {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hi, Folks!', style: TextStyle(fontSize: 40, color: Colors.grey),)
          ],
        )
      ],
    ),
  );
}