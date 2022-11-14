import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    // print(FirebaseAuth.instance.currentUser!.email);
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
          children: [
            SizedBox(
              height: 200.0,
              child: Image.asset(image),
            ),
            const SizedBox(height: 48.0),
            CustomTextField(
                onChanged: (value) {}, hintText: 'Enter your email'),
            const SizedBox(height: 8.0),
            CustomTextField(
              onChanged: (value) {},
              hintText: 'Enter your password.',
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            ButtonWidget(
                color: Colors.lightBlueAccent, onTap: () {}, title: 'Login')
          ],
        ),
      ),
    );
  }
}
