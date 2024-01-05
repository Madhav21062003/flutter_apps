// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasepractise/home_screen.dart';
import 'package:firebasepractise/phone_auth/signin_with_phone.dart';
import 'package:firebasepractise/services/notification_services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized.

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // For Firebase Notifications
     await NotificationService.initialize();

    // Initialize Firebase

       //                     Fetching The data from the Firebase Firestore

    // QuerySnapshot snapshot = await FirebaseFirestore.instance.collection("users").get();
    //
    // for(var doc in snapshot.docs){
    //   print(doc.data().toString());
    // }

       //                     Storing data into the Firebase Firestore statically

    // FirebaseFirestore firestore = FirebaseFirestore.instance;
    // Remember the data that is stored in  the Firestore is in the form of Maps
    // Map<String, dynamic>  newUserData = {
    //   "name" : "slantcode",
    //   "email" : "slantcode@gmail.com" };
    // await firestore.collection("users").doc("your-id-here").set(newUserData);
    // log("New user saved");

    // creating a new field in documents
    // await _firestore.collection("user").doc("your-id-here").set(newUserData);

    // Udating data into the Firestore
    // await firestore.collection("user").doc("your-id-here").update({
    //   "email" : "slant2@gmail.com"
    // });
    // print("User Updated");
    // print("new user added");

    // Delete data from firebase
    // await firestore.collection("user").doc("your-id-here").delete();
    // print("User deleted");

    runApp(MyApp());
  } catch (e) {
    print("Error initializing Firebase: $e");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: (FirebaseAuth.instance.currentUser != null)
          ? HomeScreen()
          : SignInWithPhone(),
    );
  }
}
