import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:se7ety_dk_8_11/feature/doctor/home/home_view.dart';
import 'package:se7ety_dk_8_11/feature/patient/home/home_view.dart';
import 'package:se7ety_dk_8_11/feature/welcome_view.dart';
import 'package:se7ety_dk_8_11/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;

  Future<void> _getUser() async {
    user = _auth.currentUser;
  }

  @override
  void initState() {
    super.initState();
    _getUser();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => user == null
                  ? (true)
                      ? const WelcomeView()
                      : const OnBoardingView()
                  : (true)
                      ? const HomeView()
                      : const DoctorHomeView(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', width: 250),
          ],
        ),
      ),
    );
  }
}
