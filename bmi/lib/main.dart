import 'package:flutter/material.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "" ;
  var bgColor = Colors.indigo.shade50 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI App'),
        ),
        body: Container(
          child: Center(
            child: SizedBox(
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'BMI',
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  TextField(
                    controller: wtController,
                    decoration: const InputDecoration(
                      label: Text('Enter your weight in Kg'),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  TextField(
                    controller: ftController,
                    decoration: const InputDecoration(
                        label: Text('Enter your Height (in Feet)'),
                        prefixIcon: Icon(Icons.height)),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  TextField(
                    controller: inController,
                    decoration: const InputDecoration(
                        label: Text('Enter your height (in inch)'),
                        prefixIcon: Icon(Icons.height)),
                  ),

                  SizedBox(height: 20,),

                  ElevatedButton(onPressed: (){

                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();

                    if(wt != "" && ft != "" && inch != "" ){

                      // BMI Calculation
                      var iwt = int.parse(wt);
                      var ift = int.parse(ft);
                      var iInch = int.parse(inch) ;

                      var totalInch = (ift * 12) + iInch ;

                      var totalCm = totalInch * 2.54 ;
                       var totalMeter = totalCm / 100 ;
                       var bmi = iwt / (totalMeter * totalMeter);

                       var msg = "" ;

                       if(bmi  > 25){
                         msg = "You are over Weight" ;
                            bgColor = Colors.orange.shade200;
                       }
                       else if(bmi < 15){
                         msg = "You are under Weight" ;
                         bgColor = Colors.red.shade200;
                      }else{
                         msg = "You are Healthy" ;
                         bgColor = Colors.green.shade200;
                      }
                        setState(() {
                          result = "$msg \nYour Bmi is: ${bmi.toStringAsFixed(3)} " ;
                        });
                    }else {
                        setState(() {
                          result = "Please fill all the required blanks";
                        });
                    }
                  }, child: const Text('Generate BMI')),
                  const SizedBox(height: 11,),
                  Text(result, style: const TextStyle(fontSize: 19),)
                ],
              ),
            ),
          ),
        ));
  }
}
