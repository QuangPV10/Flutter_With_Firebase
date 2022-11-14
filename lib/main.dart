import 'package:first_project_with_firebase/src/constants/route_names.dart';
import 'package:first_project_with_firebase/src/route_controller.dart';
import 'package:first_project_with_firebase/src/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.initial,
      onGenerateRoute: RouteController().routePage,
      home: const WelcomeScreen(),
    );
  }
}
