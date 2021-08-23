import 'package:flutter/material.dart';

class SplashBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child: CircularProgressIndicator(),
      );
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SplashBody(),
      );
}
