import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

/// this is your APP Main screen configuration
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

/// this is a template to start building a UI
/// to start adding any UI you want change what comes after the [ body: ] tag below
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      /*******************--[focus here 🧐]--*******************/
      appBar: AppBar(
        leading: const Icon(Icons.android_sharp),
        title: const Text('App Title'),
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      body: myWidget(),
      /*******************--[focus here 🧐]--*******************/
    );
  }

  Widget myWidget() {
    return Container(
      // margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      // color: Colors.blueGrey,
      height: 300,
      child:
      /*******************--[focus here 🧐]--*******************/
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('I', style: TextStyle(color: Colors.red, fontSize: 50)),
          Icon(Icons.favorite, size: 50, color: Colors.red),
          Text('Flutter', style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30)),
          Image.network("https://www.kindpng.com/picc/m/355-3557482_flutter-logo-png-transparent-png.png")
        ],
      )
      /*******************--[focus here 🧐]--*******************/
    );
  }
}

// Container(
// // color: Colors.blue,
// margin:
// width: 300,
// height: 100,
// decoration: BoxDecoration(
// border: Border.all(width: 7),
// color: Colors.deepPurple,
// ),
// child: Center(child: Text('Quiz Container',style: TextStyle(color: Colors.black, fontSize: 30, letterSpacing: 2 ,fontFamily: "casual", fontWeight: FontWeight.w500)))
// )

// Image.asset("assets/scrum.jpg" )

// ElevatedButton(
// style: ElevatedButton.styleFrom(
// padding: EdgeInsets.only(left: 70.0, right: 70),
// elevation: 5,
// shape: StadiumBorder(),
// ),
// child: Text('Press me', style: TextStyle(color: Colors.yellow, fontFamily: "casual", fontWeight: FontWeight.bold)),
// onPressed: (){}
// )

// Icon(Icons.whatshot, size: 150, color: Colors.red)

// Text(
// 'Your first Quiz',
// style: TextStyle(color: Colors.green, fontSize: 40, letterSpacing: 2 ,fontFamily: "casual", backgroundColor: Colors.yellow[300], fontStyle: FontStyle.italic),
// ),