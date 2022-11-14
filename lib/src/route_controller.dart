import 'package:first_project_with_firebase/src/constants/route_names.dart';
import 'package:first_project_with_firebase/src/screens/chat_screen.dart';
import 'package:first_project_with_firebase/src/screens/not_found_screen.dart';
import 'package:first_project_with_firebase/src/screens/registration_screen.dart';
import 'package:first_project_with_firebase/src/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'screens/login_screen.dart';

class RouteController {
  MaterialPageRoute routePage(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) {
        switch (settings.name) {
          case RouteNames.initial:
          case RouteNames.welcomeScreem:
            return const WelcomeScreen();
          case RouteNames.loginScreen:
            return const LoginScreen();
          case RouteNames.chatScreen:
            return const ChatScreen();
          case RouteNames.registrationScreen:
            return const RegistrationScreen();
          default:
            return const NotFoundScreen();
        }
      },
      settings: settings,
    );
  }
}
