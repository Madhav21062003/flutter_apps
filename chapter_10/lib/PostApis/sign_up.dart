// ignore_for_file: unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Sign Up')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Email Form Field
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),

            // Password form fields
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: ('Password'),
              ),
            ),

            SizedBox(
              height: 40,
            ),

            GestureDetector(
              onDoubleTap: () {
                // Taking input from email field
                login(emailController.text.toString(),
                    passwordController.text.toString());
              },
              child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 171, 222, 135),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text('Sign Up')),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void login(String email, String password) async {
  try {
    Response response =
        await post(Uri.parse('https://reqres.in/api/register'), body: {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(data['id']);
      print('Account created successfully');
    } else {
      print('Failed to make account');
    }
  } catch (e) {
    print(e.toString());
  }
}
