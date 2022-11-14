import 'package:flutter/material.dart';

import '../constants/route_names.dart';
import '../widgets/button_widget.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
            Row(
              children: <Widget>[
                SizedBox(
                  height: 60.0,
                  child: Image.asset('assets/images/logo.png'),
                ),
                const Text(
                  'Flash Chat',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 48.0),
            ButtonWidget(
                color: Colors.lightBlueAccent,
                onTap: () =>
                    Navigator.of(context).pushNamed(RouteNames.loginScreen),
                title: 'Log In'),
            ButtonWidget(
                color: Colors.blueAccent,
                onTap: () => Navigator.of(context)
                    .pushNamed(RouteNames.registrationScreen),
                title: 'Register'),
          ],
        ),
      ),
    );
  }
}
