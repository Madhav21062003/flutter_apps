// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebasepractise/phone_auth/signin_with_phone.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  File? profilePic;

  void saveUser() async {
    // Takin and storing values in Variables from the text fields
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String ageString = ageController.text.trim();

    // covert age into integer
    int age = int.parse(ageString);
    nameController.clear();
    emailController.clear();
    ageController.clear();
    if (name != "" && email != "" && profilePic != null) {

      UploadTask uploadTask =  FirebaseStorage.instance.ref().child("profilepictures").child(Uuid().v1()).putFile(profilePic!);

     StreamSubscription taskSubscription =  uploadTask.snapshotEvents.listen((snapshot) {
        double percentage = snapshot.bytesTransferred / snapshot.totalBytes * 100 ;
        log(percentage.toString());
      });

    TaskSnapshot taskSnapshot =   await uploadTask;
    String downloadUrl =  await taskSnapshot.ref.getDownloadURL();

    taskSubscription.cancel();

      Map<String, dynamic> userData = {
        "name": name,
        "email": email,
        "age": age,
        "profilepic": downloadUrl
       };
      FirebaseFirestore.instance.collection("user").add(userData);
      log("User Created");
    } else {
      print("Please fill all the fields");
    }
    setState(() {
      profilePic = null;
    });
  }

  // function for Logout
  void logout() async {
    await FirebaseAuth.instance.signOut();

    // after you logged out successfully you will be redirected to the Login page
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (context) => SignInWithPhone()));
  }

  void deleteUser(String documentId) {
    FirebaseFirestore.instance
        .collection("user")
        .doc(documentId) // Reference the document using its ID
        .delete()
        .then((_) {
      // Handle the success of the deletion
      log("User Deleted");
    }).catchError((error) {
      // Handle any errors that occur during deletion
      log("Error deleting user: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Screen'),
          automaticallyImplyLeading: false,
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  // when we pressed on icon button the user will be logout
                  logout();
                },
                icon: Icon(Icons.exit_to_app))
          ],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
              children: [
                CupertinoButton(
                  onPressed: () async {
                    //  Select Image from the gallery
                    XFile? selectedImage = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);

                    //  Show selected image in app

                    if (selectedImage != null) {
                      File convertedFile = File(selectedImage.path);
                      setState(() {
                        profilePic = convertedFile;
                      });
                      log("Image Selected");
                    } else {
                      log("No Image Selected");
                    }
                  },
                  padding: EdgeInsets.zero,
                  child: Center(
                    child: CircleAvatar(
                      radius: 80,
                      //  Showing image ion circular avatar
                      backgroundImage:
                          (profilePic != null) ? FileImage(profilePic!) : null,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(hintText: "Name"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(hintText: "E-mail"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: ageController,
                  decoration: InputDecoration(hintText: "Age"),
                ),
                SizedBox(
                  height: 20,
                ),
                CupertinoButton(
                    child: Text("Save"),
                    onPressed: () {
                      saveUser();
                    }),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5, // Adjust the height according to your needs
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("user")
                          .orderBy("age")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.active) {
                          if (snapshot.hasData && snapshot.data != null) {
                            return Expanded(
                              child: ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    Map<String, dynamic> userMap =
                                        snapshot.data!.docs[index].data()
                                            as Map<String, dynamic>;
                                    String documentId = snapshot.data!.docs[index]
                                        .id; // Get the document ID
                                    return ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(userMap["profilepic"]),
                                      ),
                                      title: Text(
                                          userMap["name"] + " (${userMap["age"]})"),
                                      subtitle: Text(userMap["email"]),
                                      trailing: IconButton(
                                          onPressed: () {
                                            // Delete
                                            deleteUser(documentId);
                                          },
                                          icon: Icon(Icons.delete)),
                                    );
                                  }),
                            );
                          } else {
                            return Text("No data!");
                          }
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                )
              ],
          ),
        ),
            )));
  }
}
