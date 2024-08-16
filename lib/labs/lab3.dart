import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  bool isOpened = false;
  bool isCurlceOnTheLeft = false;
  FlutterLogoStyle flutterLogoStyle = FlutterLogoStyle.stacked;
  bool isHeartLocked = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(
          'Lab 3',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: AnimatedContainer(
        margin: EdgeInsets.all(20),
        duration: Duration(milliseconds: 450),
        width: screenWidth,
        height: isOpened ? screenHeight : 60,
        // to 0 when click on it, to screen height when also click on it
        color: Colors.indigo,
        child: Stack(
          children: [
            Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 16),
              color: Colors.yellow,
              child: InkWell(
                onTap: () {
                  isOpened = !isOpened;
                  setState(() {});
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Text(
                          'Click to Expand',
                          style: TextStyle(fontSize: 18),
                        )),
                    !isOpened
                        ? Icon(Icons.keyboard_arrow_up)
                        : Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    changeShapes(screenWidth),
                    flutterChanger(screenWidth),
                    showHide(screenWidth),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget changeShapes(double width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
          margin: EdgeInsets.all(8),
          color: Colors.white,
          width: width,
          height: 150,

          /// ********** Do changes in child below ********** ///
          child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: !isCurlceOnTheLeft ? Colors.red : Colors.blue,
                          shape: !isCurlceOnTheLeft
                              ? BoxShape.rectangle
                              : BoxShape.circle,
                        ),
                      ),
                      onTap: () {
                        isCurlceOnTheLeft = !isCurlceOnTheLeft;
                        setState(() {});
                      }),
                  InkWell(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: isCurlceOnTheLeft ? Colors.red : Colors.blue,
                        shape: isCurlceOnTheLeft ? BoxShape.rectangle : BoxShape
                            .circle,
                      ),
                    ),
                    onTap: () {
                      isCurlceOnTheLeft = !isCurlceOnTheLeft;
                      setState(() {});
                    },
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget flutterChanger(double width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
          margin: EdgeInsets.all(8),
          color: Colors.white,
          width: width,
          height: 150,

          /// ********** Do changes in child below ********** ///
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FlutterLogo(style: flutterLogoStyle, size: 100,),
                IconButton(onPressed: () {
                  if (flutterLogoStyle == FlutterLogoStyle.markOnly) {
                    flutterLogoStyle = FlutterLogoStyle.horizontal;
                  } else if (flutterLogoStyle == FlutterLogoStyle.horizontal) {
                    flutterLogoStyle = FlutterLogoStyle.stacked;
                  } else
                    flutterLogoStyle = FlutterLogoStyle.markOnly;
                  setState(() {});
                },
                    icon: Icon(
                      Icons.change_circle, color: Colors.purple, size: 40,))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget showHide(double width) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Container(
            margin: EdgeInsets.all(8),
            color: Colors.white,
            width: width,
            height: 150,

            /// ********** Do changes in child below ********** ///
            child: Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                Opacity( opacity: isHeartLocked ? 1.0: 0.0,
                    child: Icon(Icons.favorite, color: Colors.red, size: 100)),
            IconButton(onPressed: () {
              isHeartLocked = !isHeartLocked;
              setState(() {});
            }, icon:
            Icon(isHeartLocked ? Icons.lock : Icons.lock_open,
                color: Colors.purple, size: 50))
            ],
          ),
        )),)
    ,
    );
  }
}
