import 'package:flutter/material.dart';

class SingleColumnBody extends StatelessWidget {
  final List<Widget> children;
  final bool scrollView;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;

  const SingleColumnBody({
    required this.children,
    this.scrollView = true,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
  });
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 570,
          minWidth: 300,
          maxHeight: double.infinity,
        ),
        child: Padding(
          padding: MediaQuery.of(context).size.width < 300
              ? EdgeInsets.only(left: 8, right: 8)
              : EdgeInsets.only(left: 16, right: 16),
          child: scrollView
              ? SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 96),
                    child: Column(
                      mainAxisAlignment: mainAxisAlignment,
                      mainAxisSize: mainAxisSize,
                      crossAxisAlignment: crossAxisAlignment,
                      children: children,
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(bottom: 96),
                  child: Column(
                    mainAxisAlignment: mainAxisAlignment,
                    mainAxisSize: mainAxisSize,
                    crossAxisAlignment: crossAxisAlignment,
                    children: children,
                  ),
                ),
        ),
      ),
    );
  }
}
