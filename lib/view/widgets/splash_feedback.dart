import 'package:flutter/material.dart';
import 'package:poke_flutter/resource/strings.dart';

class SplashFeedback extends StatelessWidget {
  const SplashFeedback({Key? key, this.state = SplashFeedbackState.loading})
      : super(key: key);

  final SplashFeedbackState state;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(35),
        alignment: Alignment.center,
        height: 350,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _getLoadingWidget(),
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
              textAlign: TextAlign.center,
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

  Widget _getLoadingWidget() {
    if (state == SplashFeedbackState.loading) {
      return const Image(
          height: 50,
          width: 50,
          image: AssetImage('assets/character_walking.gif'));
    } else {
      return Container(height: 0);
    }
  }
}

enum SplashFeedbackState { loading, error }
