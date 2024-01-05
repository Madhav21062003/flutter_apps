import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // this is used disable debug tag from the app
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('images/logo.png'),
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Maintenance',
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Rubik Medium',
                              color: Color(0xff2D3142)),
                        ),
                        Text(
                          'Box',
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Rubik Medium',
                              color: Color(0xffF9703B)),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Rubik Medium',
                        color: Color(0xff2D3142)),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                const Center(
                  child: Text(
                    'Login Here to enter \ninto the app',
                    style: TextStyle(
                        fontSize: 19,
                        fontFamily: 'Rubik Regular',
                        color: Color(0xff4C5980)),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    decoration:const InputDecoration(
                      hintText: 'Email',
                      fillColor: Color(0xff8F9FA),
                      filled: true,

                      prefixIcon: Icon(Icons.alternate_email, color: Color(0xff323F4B),),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffE4E7EB))
                      )
                    ),
                  ),
                ),

                
               
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: TextFormField(
                    decoration:const InputDecoration(
                        hintText: 'Password',
                        fillColor: Color(0xff8F9FA),
                        filled: true,
                        suffixIcon: Icon(Icons.visibility_off_outlined ),
                        prefixIcon: Icon(Icons.lock_open, color: Color(0xff323F4B),),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffE4E7EB))
                        )
                    ),
                  ),
                ),
               const SizedBox(height: 300,),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Rubik Regular',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center ,
                  children: [

                    SizedBox(height: 15,),
                    Center(
                      child: Text(
                        'Dont have an account?',
                        style: TextStyle(
                            fontSize: 19,
                            fontFamily: 'Rubik Regular',
                            color: Color(0xff4C5980)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 19,
                            fontFamily: 'Rubik Medium',
                            color: Color(0xffF9703B)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )

              ],
            ),
          ),
        ));
  }
}
