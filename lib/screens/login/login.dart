import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:whatsapp_status_screen/config/theme_colors.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    void navigateToRegister() {
      Navigator.pushNamed(context, "/register");
    }

    void handleSubmit() async {
      if (_formKey.currentState.validate()) {
        CollectionReference users =
            FirebaseFirestore.instance.collection('users');
        try {
          EasyLoading.show(status: 'Logging in...');
          UserCredential userCredential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text);
          DocumentSnapshot userResponse =
              await users.doc(userCredential.user.uid).get();

          Map<String, dynamic> user = {
            ...userResponse.data(),
            "uid": userResponse.id
          };

          EasyLoading.showSuccess('User logged in');
          Navigator.pushNamed(context, "/", arguments: {"user": user});
        } catch (e) {
          print(e);
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Login",
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
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
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
                          borderRadius: BorderRadius.all(Radius.circular(10))),
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
                      onTap: navigateToRegister,
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Don't have an account?",
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
    );
  }
}
