import 'package:first_project_with_firebase/src/auth.dart';
import 'package:first_project_with_firebase/src/constants/constants.dart';
import 'package:flutter/material.dart';

import '../constants/route_names.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_field_widget.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email = '';
  String password = '';
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
            SizedBox(
              height: 200.0,
              child: Image.asset(image),
            ),
            const SizedBox(height: 48.0),
            CustomTextField(
                onChanged: (value) {
                  email = value!;
                },
                hintText: 'Enter your email'),
            const SizedBox(height: 8.0),
            CustomTextField(
              onChanged: (value) {
                password = value!;
              },
              hintText: 'Enter your password',
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            ButtonWidget(
                color: Colors.blueAccent,
                onTap: () {
                  Auth().createUserWithEmailAndPassword(
                      email: email, password: password);
                  Navigator.of(context).pushNamed(RouteNames.loginScreen);
                },
                title: 'Register')
          ],
        ),
      ),
    );
  }
}
