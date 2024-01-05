import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {

  @override
  Widget build(BuildContext context) {

    final countProvider = Provider.of<CountProvider>(context, listen: false);
      print('buuild');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Count Example'),
      ),

      body: Consumer<CountProvider>(builder: (context, value, child){
        return Center(child: Text(countProvider.count.toString(), style: TextStyle(fontSize: 50),)) ;
      }),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          countProvider.setCount();
    },
    child: Icon(Icons.add),
    ),
    );
  }
}
