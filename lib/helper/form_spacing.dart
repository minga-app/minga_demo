import 'package:flutter/material.dart';

class FormFieldSpacing extends StatelessWidget {
  final String? title;
  final Widget child;
  final bool divided;
  const FormFieldSpacing({
    this.title,
    required this.child,
    this.divided = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (divided)
            Divider(
              thickness: 1.5,
            ),
          if (title != null)
            Text(title ?? '',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: Colors.grey[600])),
          child,
        ],
      ),
    );
  }
}
