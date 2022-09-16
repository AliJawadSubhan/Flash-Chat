import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchat/consts.dart';
import 'package:flashchat/screens/chat_screen.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/my_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registrationscreen';

  const RegistrationScreen({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showSpinner = false;
  String? email;
  String? password;
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
                  myText: "Register",
                  mycolor: Colors.blueAccent,
                  onpress: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    final newUser = await auth.createUserWithEmailAndPassword(
                      email: email!,
                      password: password!,
                    );
                    if (newUser != null) {
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
