import 'package:flutter/material.dart';
import 'package:jflashchat/components/custom_raised_button.dart';
import 'package:jflashchat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jflashchat/screens/chat_screen.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = "REGISTRATION_SCREEN";

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email = "";
  String password = "";
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;

  void registerUser() async {
    try {
      Loader.show(context,
          progressIndicator: const CircularProgressIndicator());

      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      Loader.hide();

      Navigator.pushNamed(context, ChatScreen.id);
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    Loader.hide();
    super.dispose();
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
            SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) {
                email = value;
              },
              textAlign: TextAlign.center,
              decoration: kInputDecoration.copyWith(
                hintText: "Enter your email",
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
                onChanged: (value) {
                  password = value;
                },
                textAlign: TextAlign.center,
                obscureText: true,
                decoration:
                    kInputDecoration.copyWith(hintText: "Enter your password")),
            const SizedBox(
              height: 24.0,
            ),
            CustomRaisedButton(
              color: Colors.blueAccent,
              onPress: () => registerUser(),
              text: "Register",
            ),
          ],
        ),
      ),
    );
  }
}
