// import 'package:flutter/material.dart';
//
// void main () => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(fontFamily: 'Fredoka One'),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Flutter course'),
//         ),
//         body: BodyWidget(),
//         bottomNavigationBar: BottomAppBar(
//           backgroundColor: Colors.greenAccent,
//           shape: CircularNotchedRectangle(),
//           children: [
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//             BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Home')
//           ]
//         ),
//         drawer: Drawer(
//           child: Container(
//             padding: EdgeInsets.all(20),
//             child: Column(
//               children: [
//                 DrawerHeader(child: Text('Cool app 😎', style: TextStyle(fontSize: 40),), ),
//                 ListTile(title: Text('Some title'),leading: Icon(Icons.rocket),)
//               ],
//             ),
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(onPressed: ()=> {},),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//
//     );
//   }
// }
//
// Widget BodyWidget () {
//   return Center(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Hi, Folks!', style: TextStyle(fontSize: 40, color: Colors.grey),)
//           ],
//         )
//       ],
//     ),
//   );
// }