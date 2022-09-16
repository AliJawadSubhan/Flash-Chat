import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flashchat/screens/login_screen.dart';
import 'package:flashchat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/my_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = '/welcome_screen';

  const WelcomeScreen({
    Key? key,
  }) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState

    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
      upperBound: 100,
    );

    controller?.forward();

    controller?.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.android_sharp, size: 100, color: Colors.lightBlue),
            Row(
              children: <Widget>[
                Expanded(
                  child: Hero(
                    tag: 'logo',
                    child: SizedBox(
                      height: controller!.value,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    // FlickerAnimatedText(
                    //   'FlashX Chat',
                    //   textStyle: TextStyle(
                    //     fontSize: 35,
                    //     color: Colors.white,
                    //     shadows: [
                    //       Shadow(
                    //         blurRadius: 7.0,
                    //         color: Colors.white,
                    //         offset: Offset(0, 0),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    TypewriterAnimatedText(
                      'FlashX chat',
                      textStyle: const TextStyle(
                        color: Colors.black54,
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                      speed: const Duration(milliseconds: 200),
                    ),
                  ],
                  totalRepeatCount: 1,
                  pause: const Duration(milliseconds: 100),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            MyButton(
              myText: "Login",
              mycolor: Colors.lightBlueAccent,
              onpress: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            MyButton(
              myText: "Register",
              mycolor: Colors.blueAccent,
              onpress: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
