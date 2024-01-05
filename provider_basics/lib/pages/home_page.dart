import 'package:flutter/material.dart';
import 'package:provider_basics/provider/home_page_provider.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
      ),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ChangeNotifierProvider<HomePageProvider>(
                create: (context) => HomePageProvider(),
                child: Consumer<HomePageProvider>(builder: (context, provider, child){
                  return  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const SizedBox(height: 20,),

                      Text(provider.eligibilityMessage.toString(), style: TextStyle(
                        color: (provider.isEligible == true)? Colors.green: Colors.red,
                      ),),

                      const SizedBox(height: 20,),
                       TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Enter Your age",
                        ),

                        onChanged: (val){
                          provider.checkEligibility(int.parse(val));
                        },
                      )
                    ],
                  );
                }),
              ))),
    );
  }
}
