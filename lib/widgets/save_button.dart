import 'package:flutter/material.dart';
import 'package:minga_demo/main.dart';

import '../theme.dart';

class SaveButton extends StatefulWidget {
  final Widget label;
  final Icon icon;
  final bool deactivateAfterSaved;
  final bool initialValue;
  final Future Function() onPressed;
  const SaveButton({
    required this.label,
    required this.icon,
    this.deactivateAfterSaved = true,
    required this.initialValue,
    required this.onPressed,
  });
  @override
  _SaveButtonState createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  bool _saving = false;
  Widget _buildIcon() {
    if (widget.initialValue) {
      return Icon(Icons.check);
    }
    if (_saving) {
      return SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
          backgroundColor: Colors.transparent,
        ),
      );
    }
    return widget.icon;
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      onPressed: widget.initialValue && widget.deactivateAfterSaved
          ? null
          : () async {
              setState(() {
                _saving = true;
              });
              await widget.onPressed();
              setState(() {
                _saving = false;
              });
            },
      label: widget.label,
      icon: _buildIcon(),
      elevation: 0,
      disabledElevation: 0,
      highlightElevation: 1,
      disabledColor: primary100,
    );
  }
}
