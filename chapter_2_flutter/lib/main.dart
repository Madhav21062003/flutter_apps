import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: const Text(
            'Madhav Solanki',
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700),
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text(
                    'Madhav',
                    style: TextStyle(
                        fontSize: 50,
                        fontFamily: 'Roboto',
                        color: Colors.yellow,
                        decoration: TextDecoration.underline),
                  ),
                  Icon(Icons.ac_unit),
                  Text('Madhav'),
                  Icon(Icons.ac_unit),
                ],
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.lightBlueAccent,
                child: const Center(child: Text('Container 3')),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.amberAccent,
                child: const Center(child: Text('Container 2')),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.greenAccent,
                child: const Center(child: Text('Container 2')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
