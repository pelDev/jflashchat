import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:jflashchat/components/custom_raised_button.dart';
import 'package:jflashchat/screens/login_screen.dart';
import 'package:jflashchat/screens/registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = "WELCOME_SCREEN";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'Logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: const TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                  totalRepeatCount: 1,
                  pause: const Duration(milliseconds: 1000),
                  displayFullTextOnTap: false,
                  stopPauseOnTap: true,
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            CustomRaisedButton(
              color: Colors.lightBlueAccent,
              onPress: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              text: "Log In",
            ),
            CustomRaisedButton(
              color: Colors.blueAccent,
              onPress: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              text: "Register",
            ),
          ],
        ),
      ),
    );
  }
}
