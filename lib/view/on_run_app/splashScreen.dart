import 'package:flutter/material.dart';
import 'package:sport/view/home/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  naveToHome() async {
    Future.delayed(const Duration(seconds: 2)).then(
      (value) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
            (Route<dynamic> route) => false);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    naveToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/person.png", height: 250),
      ),
    );
  }
}
