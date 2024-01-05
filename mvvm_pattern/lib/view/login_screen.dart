// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:mvvm_pattern/utils/routes/routes_names.dart';
import 'package:mvvm_pattern/utils/utils.dart';
import 'package:mvvm_pattern/view/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: InkWell(
        onTap: () {
          // Navigator.pushNamed(context, RoutesName.home);
          // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));

          // Utils.toastMessage('No Internet Connection');
          Utils.snackBar('No connection', context);
        },
        child: Text('Click'),
      ),
    ));
  }
}
