import 'package:flutter/material.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // to change your app color change this
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}

/// this is a template to start building a UI
/// to start adding any UI you want change what comes after the [ body: ] tag below
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          title: Text(
            'Flower Shop',
            style: TextStyle(fontFamily: 'casual'),
          ),
          elevation: 0.0,
        ),
        body: ListView(
          children: <Widget>[
            flowerDetails(context),
          ],
        ));
  }
}


Widget flowerDetails(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(20),
    color: Colors.amber,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        imageGroup(),
        titleGroup(),
        iconGroup(),
        textGroup(),
        buttonGroup(),
      ],
    ),
  );
}

/// Image URL
/// https://newevolutiondesigns.com/images/freebies/yellow-wallpaper-12.jpg

Widget imageGroup() {
  return Image.network("https://newevolutiondesigns.com/images/freebies/yellow-wallpaper-12.jpg", fit: BoxFit.cover);
}
Widget titleGroup() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 16, bottom: 8),
          child: Text('Sunny flowers', style: TextStyle( fontSize: 52, fontFamily: 'cursive'),),
        ),
        Text('12 dozen', style: TextStyle(color: Colors.black54, fontSize: 14),),
      ],
    )
  );
}

Widget iconGroup() {
  return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(Icons.share, size: 40, color: Colors.indigo,),
          Icon(Icons.favorite, size: 40, color: Colors.indigo)
        ],
      )
  );
}
/// here is the text to copy
///Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
Widget textGroup() {
  return Container(
      padding: EdgeInsets.only(top: 16, bottom: 40),
      child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
            style: TextStyle(fontSize: 14, fontFamily: 'casual'))
  );
}

Widget buttonGroup() {
  return Center(
    child: ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        primary: Colors.indigo,
        onPrimary: Colors.white,
        surfaceTintColor: Colors.amber,
        elevation: 5,
        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 8),
        shape: StadiumBorder(),
      ),
      icon: Icon(Icons.add_shopping_cart),
      label: Text('ADD TO CART'),
      onPressed: () => {},
    )
  );
}

// Row( children: [
//   Icon(Icons.shopping_cart),
//   Text('ADD TO CART')
// ],),