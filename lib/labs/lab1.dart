import 'package:flutter/material.dart';

void main() => runApp(Lab1());

/// this is your APP Main screen configuration
class Lab1 extends StatelessWidget {
  Lab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LAb1HomePage(),
    );
  }
}

/// this is a template to start building a UI
/// to start adding any UI you want change what comes after the [ body: ] tag below
class LAb1HomePage extends StatelessWidget {
  LAb1HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      /*******************--[focus here 🧐]--*******************/
      appBar: AppBar(
        leading: const Icon(Icons.stars),
        title: const Text('Lab 1'),
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      body: myWidget(),
      /*******************--[focus here 🧐]--*******************/
    );
  }

  Widget myWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          /*******************--[focus here 🧐]--*******************/
          SizedBox(height: 25,),
          exercise1(),
          SizedBox(height: 25,),
          exercise2(),
          SizedBox(height: 25,),
          exercise3(),
          SizedBox(height: 25,),
          exercise4(),
          SizedBox(height: 25,),
          exercise5(),
          SizedBox(height: 25,),
          exercise6(),
          /*******************--[focus here 🧐]--*******************/
        ],
      ),
    );
  }

  /// TODO: Implement Exercises below as per the handed Document
  Widget exercise1() {
    return
      Text(
      'Welcome to lab1',
      style: TextStyle(color: Colors.green[200], fontSize: 30, letterSpacing: 4 ,fontFamily: "monospace", backgroundColor: Colors.grey, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
      );
  }

  Widget exercise2() {
    return Icon(Icons.share, size: 80, color: Colors.blue);
  }

  /// TODO : print on the screen on Pressed when clicking on the button, and print on Long Pressed when long click to Button
  Widget exercise3() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.only(left: 30.0, right: 30),
        elevation: 5,
        shape: StadiumBorder(),
        primary: Colors.blue[700]
      ),
      child: Text('Click here', style: TextStyle(fontSize: 16,
          color: Colors.yellow,
          fontWeight: FontWeight.bold)),
      onPressed: () => {
        print('on Pressed')
      },
      onLongPress: () => {
        print('Long Pressed')
      },
    );
  }

  Widget exercise4() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          elevation: 5,
          shape: CircleBorder(),
        ),
        child: Icon(
            Icons.favorite,
            color: Colors.greenAccent, size: 18
        ),
        onPressed: () => {});
  }

  Widget exercise5() {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          primary: Colors.red,
          padding: EdgeInsets.only(left: 28.0, right: 28),
          side: BorderSide(width: 1.0, color: Colors.orange),
      ),
      child: Text('Button to press'),
      onPressed: () => {},
    );
  }



  Widget exercise6() {
    return Container(
        // color: Colors.blue,
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 10,
              color: Colors.lightBlueAccent,
            ),
            right: BorderSide(
              width: 10,
              color: Colors.deepPurple,
            ),
            bottom: BorderSide(
              width: 10,
              color: Colors.red,
            ),
            left: BorderSide(
              width: 10,
              color: Colors.blue,
            ),
          ),
          color: Colors.yellow,
        ),
        child: Center(child: Icon(Icons.warning, size: 50,) )
        );
  }
}