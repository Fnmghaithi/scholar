import 'package:flutter/material.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/pages/login_page.dart';
import 'package:scholar_chat/pages/register_page.dart';

void main() {
  runApp(const ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'LoginPage': (context) {
          return const LoginPage();
        },
        RegisterPage.id: (context) => RegisterPage(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      initialRoute: 'LoginPage',
    );
  }
}
