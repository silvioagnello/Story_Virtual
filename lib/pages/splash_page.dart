import 'package:eggs/pages/home_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  Future delay(context) async {
    await Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    delay(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Image.asset('assets/images/icons8-forgot-password-94.png'),
        ),
      ),
    );
  }
}
