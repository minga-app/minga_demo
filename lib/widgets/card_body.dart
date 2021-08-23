import 'package:flutter/material.dart';
import 'package:minga_demo/widgets/responsive_body.dart';

class CardBody extends StatelessWidget {
  final Widget child;

  const CardBody({required this.child});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleColumnBody(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Card(child: child),
          )
        ],
      ),
    );
  }
}
