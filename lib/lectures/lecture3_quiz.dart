import 'package:flutter/material.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.red,
        backgroundColor: Colors.white,
        accentColor: Colors.blueAccent
      )
      ),
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
            FlutterLogo(size: 70),
            Text('Flutter', style: TextStyle(fontSize: 40, color: Colors.grey),)
          ],
        ),
        ElevatedButton(onPressed: () => {}, child:
        Text('Enroll to Course')
        )
      ],
    ),
  );
}