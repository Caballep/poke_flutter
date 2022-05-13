import 'package:flutter/material.dart';
import 'package:poke_flutter/resource/strings.dart';

class SplashFeedback extends StatelessWidget {
  const SplashFeedback({Key? key, this.state = SplashFeedbackState.loading})
      : super(key: key);

  final SplashFeedbackState state;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(25),
        alignment: Alignment.center,
        height: 180,
        width: 250,
        child: Column(
          children: [
            const CircularProgressIndicator(
              color: Colors.deepOrange,
            ),
            const SizedBox(
              height: 35,
            ),
            Text(
              _getSplashFeecbackString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  shadows: [
                    Shadow(
                        color: Colors.black54,
                        blurRadius: 3.0,
                        offset: Offset(2.0, 2.0))
                  ]),
            ),
          ],
        ));
  }

  String _getSplashFeecbackString() {
    if (state == SplashFeedbackState.loading) {
      return Strings.splashLoading;
    } else {
      return Strings.splashError;
    }
  }
}

enum SplashFeedbackState { loading, error }
