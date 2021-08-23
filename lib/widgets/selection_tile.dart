import 'package:flutter/material.dart';
import 'package:minga_demo/theme.dart';

typedef SelectionOnChanged = Function(bool value);

class SelectionTile extends StatefulWidget {
  final bool value;
  final SelectionOnChanged onChanged;
  final String leftLabel, rightLabel;

  const SelectionTile({
    required this.value,
    required this.onChanged,
    required this.leftLabel,
    required this.rightLabel,
  });

  @override
  _SelectionTileState createState() => _SelectionTileState();
}

class _SelectionTileState extends State<SelectionTile> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Stack(
          children: [
            AnimatedPositioned(
              curve: Curves.fastOutSlowIn,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: primary200,
                ),
                height: 48,
                width: constraints.maxWidth / 2,
              ),
              duration: Duration(milliseconds: 500),
              left: !value ? 0 : constraints.maxWidth / 2,
              right: value ? 0 : constraints.maxWidth / 2,
              top: 0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        value = false;
                      });
                      widget.onChanged(value);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnimatedOpacity(
                            opacity: !value ? 1 : 0,
                            duration: Duration(milliseconds: 200),
                            child: Icon(
                              Icons.check,
                              size: 32,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            widget.leftLabel,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .apply(color: Colors.black),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.only(
                          left: 12, right: 12, top: 8, bottom: 8),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        value = true;
                      });
                      widget.onChanged(value);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.rightLabel,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .apply(color: Colors.black),
                          ),
                          AnimatedOpacity(
                            opacity: value ? 1 : 0,
                            duration: Duration(milliseconds: 200),
                            child: Icon(
                              Icons.check,
                              size: 32,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.only(
                          left: 12, right: 12, top: 8, bottom: 8),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
