import 'package:flutter/material.dart';
import 'package:flutter_course/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.orange,
      ),
      home:IntroPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  callBack(){
    print('clicked');
  }

  @override
  Widget build(BuildContext context) {
    var arrNames = [
      "Name_1",
      "Name_2",
      "Name_3",
      "Name_4",
      "Name_5",
      "Name_6",
      "Name_7",
      "Name_8",
      "Name_9",
      "Name_10",
      "Name_1",
      "Name_2",
      "Name_3",
      "Name_4",
      "Name_5",
      "Name_6",
      "Name_7",
      "Name_8",
      "Name_9",
      "Name_10",
      "Name_1",
      "Name_2",
      "Name_3",
      "Name_4",
      "Name_5",
      "Name_6",
      "Name_7",
      "Name_8",
      "Name_9",
      "Name_10"
    ];

    var arrColors = [Colors.red,Colors.orange,Colors.pink,Colors.teal,Colors.lightGreenAccent,Colors.lime,Colors.greenAccent,Colors.grey,Colors.deepPurpleAccent,Colors.pinkAccent, ];
    var time =DateTime.now();

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: const Text('Flutter Container'),
          ),
          body: Text('Hello')
      ),
    );
  }
}

// ===================================== Ink well Widget ==================================================================

// Center(
// child: InkWell(
// onTap: (){
// print('On tap called');
// },
// onLongPress: (){
// print('Long pressed clicked');
// },
//
// onDoubleTap: (){
// print('Double tap clicked pressed clicked');
// },
//
// child: Container(
// width: 200,
// height: 200,
// color: Colors.yellow,
// ),
// ),
//
// ),

// ===================================== Scroll view Widget ==================================================================

// SingleChildScrollView(
// scrollDirection: Axis.vertical,
// child: Column(
// children: [
//
// Container(
// margin: EdgeInsets.all( 11.0),
// width: 100,
// height: 100,
// color: Colors.green,
// ),
// Container(
// margin: EdgeInsets.all( 11),
// width: 100,
// height: 100,
// color: Colors.black,
// ),
// Container(
// margin: EdgeInsets.all( 11),
// width: 100,
// height: 100,
// color: Colors.blue,
// ),
// Container(
// margin: EdgeInsets.all( 11.0),
// width: 100,
// height: 100,
// color: Colors.green,
// ),
// Container(
// margin: EdgeInsets.all( 11),
// width: 100,
// height: 100,
// color: Colors.black,
// ),
// Container(
// margin: EdgeInsets.all( 11),
// width: 100,
// height: 100,
// color: Colors.blue,
// ),
// Container(
// margin: EdgeInsets.all( 11.0),
// width: 100,
// height: 100,
// color: Colors.green,
// ),
// Container(
// margin: EdgeInsets.all( 11),
// width: 100,
// height: 100,
// color: Colors.black,
// ),
// Container(
// margin: EdgeInsets.all( 11),
// width: 100,
// height: 100,
// color: Colors.blue,
// ),
// Container(
// margin: EdgeInsets.all( 11.0),
// width: 100,
// height: 100,
// color: Colors.green,
// ),
// Container(
// margin: EdgeInsets.all( 11),
// width: 100,
// height: 100,
// color: Colors.black,
// ),
// Container(
// margin: EdgeInsets.all( 11),
// width: 100,
// height: 100,
// color: Colors.blue,
// ),
//
//
// ],
// ),
// ),

// ===================================== List View Widget ==================================================================

// ListView(
// scrollDirection: Axis.vertical,
// children: const [
// Padding(
// padding: EdgeInsets.all(8.0),
// child: Text('One', style: TextStyle(fontSize: 20,backgroundColor: Colors.yellow, fontWeight: FontWeight.bold),),
// ),
// Padding(
// padding: EdgeInsets.all(8.0),
// child: Text('One', style: TextStyle(fontSize: 20,backgroundColor: Colors.yellow, fontWeight: FontWeight.bold),),
// ),
// Padding(
// padding: EdgeInsets.all(8.0),
// child: Text('One', style: TextStyle(fontSize: 20,backgroundColor: Colors.yellow, fontWeight: FontWeight.bold),),
// ),
// Padding(
// padding: EdgeInsets.all(8.0),
// child: Text('One', style: TextStyle(fontSize: 20,backgroundColor: Colors.yellow, fontWeight: FontWeight.bold),),
// ),
// Padding(
// padding: EdgeInsets.all(8.0),
// child: Text('One', style: TextStyle(fontSize: 20,backgroundColor: Colors.yellow, fontWeight: FontWeight.bold),),
// ),
// Padding(
// padding: EdgeInsets.all(8.0),
// child: Text('One', style: TextStyle(fontSize: 20,backgroundColor: Colors.yellow, fontWeight: FontWeight.bold),),
// ),
// Padding(
// padding: EdgeInsets.all(8.0),
// child: Text('One', style: TextStyle(fontSize: 20,backgroundColor: Colors.yellow, fontWeight: FontWeight.bold),),
// ),
// Padding(
// padding: EdgeInsets.all(8.0),
// child: Text('One', style: TextStyle(fontSize: 20,backgroundColor: Colors.yellow, fontWeight: FontWeight.bold),),
// ),
// Padding(
// padding: EdgeInsets.all(8.0),
// child: Text('One', style: TextStyle(fontSize: 20,backgroundColor: Colors.yellow, fontWeight: FontWeight.bold),),
// ),
// Padding(
// padding: EdgeInsets.all(8.0),
// child: Text('One', style: TextStyle(fontSize: 20,backgroundColor: Colors.yellow, fontWeight: FontWeight.bold),),
// ),
// ],
// ),

// ===================================== ListView.builder Widget ==================================================================
//
// var arrNames  = ["Name_1","Name_2","Name_3","Name_4","Name_5","Name_6","Name_7","Name_8","Name_9","Name_10",
//   "Name_1","Name_2","Name_3","Name_4","Name_5","Name_6","Name_7","Name_8","Name_9","Name_10",
//   "Name_1","Name_2","Name_3","Name_4","Name_5","Name_6","Name_7","Name_8","Name_9","Name_10"];

// ListView.builder(itemBuilder: (context, index) {
// return Padding(
//
// padding: const EdgeInsets.all(8.0),
// child: Text(arrNames[index], style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.deepOrange),),
// );
// } ,
// itemCount: arrNames.length,

// ===================================== ListView.builder using ListTile Widget ==================================================================

// ListView.builder(
// itemBuilder: (context, index) {
// return ListTile(
// leading: CircleAvatar(child: Text('${index+1}')),
// title: Text(
// arrNames[index],
// style: const TextStyle(
// fontSize: 20,
// color: Colors.grey,
// fontWeight: FontWeight.bold),
// ),
// subtitle: const Text(
// "Hii",
// style: TextStyle(
// fontSize: 10,
// color: Colors.grey,
// fontWeight: FontWeight.normal),
// ),
// trailing: const Icon(Icons.add),
// );
// },
// itemCount: arrNames.length,
// ),

// ===================================== Flutter styles and themes Widget ==================================================================

// return MaterialApp(
// debugShowCheckedModeBanner: false,
// title: 'Flutter Demo',
// theme: ThemeData(
// // is not restarted.
// primarySwatch: Colors.orange,
// textTheme:  TextTheme(
// headline1: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, ),
// subtitle1:  TextStyle(fontSize: 20, fontWeight: FontWeight.normal, ),
// ),
// ),
// home: const MyHomePage(),
// );

// Column(
// children: [
// Text('Hello', style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.brown)),
// Text('Hello2', style: Theme.of(context).textTheme.subtitle1,),
// Text('Hello 3', style: Theme.of(context).textTheme.headline1,),
// Text('Hello 4', style: Theme.of(context).textTheme.subtitle1,),
//
// Text('Hello  4', style: TextStyle(fontSize: 21, fontWeight: FontWeight.normal,backgroundColor: Colors.cyanAccent),),
// ],
// ),

// ===================================== Flutter Card Widget ==================================================================

// Center(
// child: const Card(
// elevation: 10,
// child: Padding(
// padding: EdgeInsets.all(8.0),
// child: Text("Hello Worl", style: TextStyle(fontSize: 22, color: Colors.green),),
// )),
// )

//  =============================================================  Text Field input

// Center(
// child: Container(
// width: 200,
// child: Center(
// child: Column(
// children: [
// TextField(
// decoration: InputDecoration(
// focusedBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(11),
// borderSide: BorderSide(
// color: Colors.yellow,
// )
// ),
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(21),
// borderSide: BorderSide(
// color: Colors.yellow,
// ))),
// ),
// SizedBox(height: 10,),
// TextField(
// decoration: InputDecoration(
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(21),
// borderSide: BorderSide(
// color: Colors.yellow,
// ))),
// ),
// ],
// ),
// )))),


// ====================================== Grid view =================================================================

// GridView.count(crossAxisCount: 5,
// crossAxisSpacing: 11,
// mainAxisSpacing: 11,
// children: [
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container(color: arrColors[0],),
// ),
//
//
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container( color: arrColors[1],),
// ),
//
//
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container( color: arrColors[2],),
// ),
//
//
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container( color: arrColors[3],),
// ),
//
//
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container( color: arrColors[4],),
// ),
//
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container(color: arrColors[0],),
// ),
//
//
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container( color: arrColors[1],),
// ),
//
//
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container( color: arrColors[2],),
// ),
//
//
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container( color: arrColors[3],),
// ),
//
//
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container( color: arrColors[4],),
// ),
//
// ],)