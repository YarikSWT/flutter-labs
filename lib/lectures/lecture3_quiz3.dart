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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int votes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.apple),
          title: Text('Flutter course'),
        ),
        body: Center(
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(onTap: () => {
                votes += 1,
                setState(() => {})
              }, child: Icon(Icons.thumb_up, size: 30, color: Colors.blue,),),
              Text("$votes", style: TextStyle(fontSize: 40, color: votes < 0 ? Colors.red : Colors.grey),),
              InkWell(onTap: () => {
                votes -= 1,
                setState(() => {})
              }, child: Icon(Icons.thumb_down, size: 30, color: Colors.red,),),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: ()=> {},)

    );
  }
}
