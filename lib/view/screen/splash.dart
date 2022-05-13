import 'package:flutter/material.dart';
import 'package:poke_flutter/view/screen/profile_creation.dart';
import 'package:poke_flutter/view/widgets/splash_feedback.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashFeedbackState splashFeedbackState = SplashFeedbackState.loading;

  @override
  void initState() {
    super.initState();

    temporalFuture
        .then((value) => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProfileCreation())))
        .catchError((error) => setState(() {
              splashFeedbackState = SplashFeedbackState.error;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.amber,
        alignment: Alignment.center,
        child: const SplashFeedback());
  }
}

Future<bool> temporalFuture =
    Future.delayed(const Duration(seconds: 3), () => true)
        .onError((error, stackTrace) => throw Exception());