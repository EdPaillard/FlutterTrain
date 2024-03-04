import 'package:flutter/material.dart';
import 'package:flash_chat_flutter_train/screens/welcome_screen.dart';
import 'package:flash_chat_flutter_train/screens/login_screen.dart';
import 'package:flash_chat_flutter_train/screens/registration_screen.dart';
import 'package:flash_chat_flutter_train/screens/chat_screen.dart';

void main() => runApp(const FlashChat());

class FlashChat extends StatelessWidget {
  const FlashChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
      },
    );
  }
}
