import 'package:flutter/material.dart';

class StateFullWidgetScreen extends StatefulWidget {
  const StateFullWidgetScreen({super.key});

  @override
  State<StateFullWidgetScreen> createState() => _StateFullWidgetScreenState();
}

class _StateFullWidgetScreenState extends State<StateFullWidgetScreen> {

  int count = 0 ;
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful Widget'),
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(DateTime.now().toString()),
          Container(
            child: Center(child: Text(count.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),)),
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){
        count++;
        print(count);
        setState(() {

        });
    },
        child: Icon(Icons.add),
      ));
  }
}
