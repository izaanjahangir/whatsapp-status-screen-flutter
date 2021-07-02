import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:whatsapp_status_screen/config/theme_colors.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController fullNameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    void navigateBack() {
      Navigator.pop(context);
    }

    void handleSubmit() async {
      if (_formKey.currentState.validate()) {
        FirebaseAuth auth = FirebaseAuth.instance;
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        CollectionReference users =
            FirebaseFirestore.instance.collection('users');

        try {
          UserCredential userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text);
          await users.doc(userCredential.user.uid).set({
            "fullName": fullNameController.text,
            "email": emailController.text
          });

          EasyLoading.showSuccess('User registered');
        } catch (e) {
          EasyLoading.showError(e.message);
        }
      }
    }

    return Scaffold(
      body: Container(
        color: ThemeColors.black,
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Register",
                  style: TextStyle(color: ThemeColors.white, fontSize: 26),
                ),
                SizedBox(
                  height: 10,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        style: TextStyle(color: ThemeColors.white),
                        controller: fullNameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          hintText: 'Enter your full name',
                          hintStyle: TextStyle(color: ThemeColors.white),
                          filled: true,
                          fillColor: ThemeColors.lightBlack,
                        ),
                        validator: (String value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        style: TextStyle(color: ThemeColors.white),
                        controller: emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          hintText: 'Enter your email',
                          hintStyle: TextStyle(color: ThemeColors.white),
                          filled: true,
                          fillColor: ThemeColors.lightBlack,
                        ),
                        validator: (String value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        style: TextStyle(color: ThemeColors.white),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(color: ThemeColors.white),
                          filled: true,
                          fillColor: ThemeColors.lightBlack,
                        ),
                        validator: (String value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: handleSubmit,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text('Submit'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                          onTap: navigateBack,
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Back to login",
                              textAlign: TextAlign.right,
                              style: TextStyle(color: ThemeColors.white),
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
