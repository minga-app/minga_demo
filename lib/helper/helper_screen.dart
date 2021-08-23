import 'package:flutter/material.dart';
import 'package:minga_demo/widgets/responsive_body.dart';

class PickupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleColumnBody(
        children: [
          Center(
            child: Column(
              children: [
                Text('Donations for pickup',
                    style: Theme.of(context).textTheme.headline5),
                Text(
                  'Management of donations that are over their maximum pickup delay and need to be assigned to a collector.',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
