import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchat/consts.dart';
import 'package:flashchat/custom_widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'chat_screen.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'loginscreen';

  const LoginScreen({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;
  bool showSpinner = false;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                const SizedBox(
                  height: 48.0,
                ),
                TextField(
                    onChanged: (value) {
                      email = value;
                      //Do something with the user input.
                    },
                    decoration: myDecoration.copyWith(hintText: 'Email')),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                      //Do something with the user input.
                    },
                    decoration: myDecoration.copyWith(hintText: 'Password')),
                const SizedBox(
                  height: 24.0,
                ),
                MyButton(
                  myText: "Login",
                  mycolor: Colors.lightBlueAccent,
                  onpress: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    final user = await auth.signInWithEmailAndPassword(
                        email: email!, password: password!);
                    if (user != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
