import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jflashchat/components/custom_raised_button.dart';
import 'package:jflashchat/constants.dart';
import 'package:jflashchat/screens/chat_screen.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

class LoginScreen extends StatefulWidget {
  static String id = "LOGIN_SCREEN";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String password = "";
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;

  @override
  void dispose() {
    Loader.hide();
    super.dispose();
  }

  void loginUser() async {
    Loader.show(context, progressIndicator: const CircularProgressIndicator());

    try {
      final loggedInUser = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      Loader.hide();

      Navigator.pushNamed(context, ChatScreen.id);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'Logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration: kInputDecoration.copyWith(
                hintText: "Enter your email",
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                password = value;
              },
              obscureText: true,
              textAlign: TextAlign.center,
              decoration: kInputDecoration.copyWith(
                hintText: "Enter your password",
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            CustomRaisedButton(
              color: Colors.lightBlueAccent,
              onPress: () => loginUser(),
              text: "Log in",
            ),
          ],
        ),
      ),
    );
  }
}
