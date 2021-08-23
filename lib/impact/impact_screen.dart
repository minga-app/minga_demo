import 'package:flutter/material.dart';

import 'package:minga_demo/widgets/app_bar.dart';
import 'package:minga_demo/widgets/responsive_body.dart';

import '../theme.dart';

class ImpactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: PageAppBar(context, 'Your Impact'),
        body: SingleColumnBody(
          children: [
            _Balance(),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: _Stats(),
            ),
          ],
        ),
      );
}

class _Stats extends StatelessWidget {
  _tile(num val, num max, String label) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var maxWidth = constraints.maxWidth * 0.80;
        var width = val.abs() / max * maxWidth;
        bool separateText = width < (label.length * 5);
        return Padding(
          padding: const EdgeInsets.only(left: 4, right: 4, top: 8, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 40,
                child: Text(
                  (val.isNegative ? '-' : '+') + '${val.abs()}',
                  style: TextStyle(
                    color: val.isNegative ? primary : Colors.lightGreen[400],
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                margin: EdgeInsets.only(left: 6, right: separateText ? 6 : 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: val.isNegative
                      ? primary200
                      : Colors.lightGreen[400]!.withOpacity(0.7),
                ),
                width: width,
                child: Text(
                  separateText ? '' : label,
                  style: TextStyle(fontSize: 13),
                ),
              ),
              if (separateText)
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                )
            ],
          ),
        );
      },
    );
  }

  _bubble(num val, num max, String label, bool positive) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var maxWidth = constraints.maxWidth - 8;
        var ratio = val == 0 ? 0.5 : (val.abs() / max * 2 + 1) / 3;
        var size = ratio * maxWidth;
        var pad = (maxWidth - size) / 2;
        _backgroundColor() {
          if (val == 0) {
            return Colors.transparent;
          }

          return positive
              ? Colors.lightGreen[400]!.withOpacity(0.7)
              : primary200;
        }

        return Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 4, right: 4, top: pad, bottom: pad),
              height: size,
              width: size,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size / 2),
                color: _backgroundColor(),
                border: Border.all(
                  color: positive
                      ? Colors.lightGreen[400]!.withOpacity(0.7)
                      : primary200,
                  width: val == 0 ? 3 : 0,
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${val.round().abs()}',
                      style: TextStyle(
                        fontSize: size / (2),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size * 0.04),
                      child: Text('x', style: TextStyle(fontSize: size / 3)),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.subtitle2,
              textAlign: TextAlign.center,
            ),
          ],
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 8),
          child:
              Text('This month', style: Theme.of(context).textTheme.headline5),
        ),
        _tile(80, 120, 'Donations'),
        _tile(120, 120, 'Voluntary Work'),
        _tile(-30, 120, 'Spent'),
        Divider(
          height: 16,
          endIndent: 32,
          indent: 12,
          thickness: 1.5,
        ),
        _tile(-50, 120, 'Sent'),
        _tile(10, 120, 'Received'),
        Divider(
          height: 16,
          endIndent: 32,
          indent: 12,
          thickness: 1.5,
        ),
        Row(
          children: [
            Flexible(
              child: _bubble(0, 14, 'donated', true),
            ),
            Flexible(
              child: _bubble(14, 14, 'volunteered', true),
            ),
            Flexible(
              child: _bubble(6, 14, 'redeemed', false),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(
            children: [
              Spacer(),
              Flexible(
                child: _bubble(3, 5, 'sent', false),
              ),
              Flexible(
                child: _bubble(5, 5, 'received', true),
              ),
              Spacer(),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
          ),
        ),
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}

class _Balance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Card(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '804',
                            style: TextStyle(
                              color: Colors.lightGreen[400],
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: Colors.green,
                                  offset: Offset(.5, .5),
                                  blurRadius: 0,
                                ),
                                Shadow(
                                  color: Colors.green,
                                  offset: Offset(1, 1),
                                  blurRadius: 0,
                                ),
                                Shadow(
                                  color: Colors.green,
                                  offset: Offset(1.5, 1.5),
                                  blurRadius: 0,
                                ),
                                Shadow(
                                  color: Colors.green,
                                  offset: Offset(2, 2),
                                  blurRadius: 0,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 62,
                            width: 62,
                            child: Stack(
                              fit: StackFit.passthrough,
                              children: [
                                Positioned(
                                    child: Icon(Icons.eco,
                                        size: 60, color: Colors.green),
                                    top: 2,
                                    left: 2),
                                Positioned(
                                    child: Icon(Icons.eco,
                                        size: 60, color: Colors.green),
                                    top: 1.5,
                                    left: 1.5),
                                Positioned(
                                    child: Icon(Icons.eco,
                                        size: 60, color: Colors.green),
                                    top: 1,
                                    left: 1),
                                Positioned(
                                    child: Icon(Icons.eco,
                                        size: 60, color: Colors.green),
                                    top: .5,
                                    left: .5),
                                Positioned(
                                    child: Icon(Icons.eco,
                                        size: 60,
                                        color: Colors.lightGreen[400]),
                                    top: 0,
                                    left: 0),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 56),
                        child: Text(
                          'Balance',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(color: Colors.grey[600]),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '12035',
                            style: TextStyle(
                              color: Colors.lightGreen[400],
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.eco, color: Colors.lightGreen[400])
                        ],
                      ),
                      Text('Total impact',
                          style: Theme.of(context).textTheme.caption),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Row(
                          children: [
                            Text(
                              '15 days',
                              style: TextStyle(
                                color: primary200,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text('Activity Streak',
                          style: Theme.of(context).textTheme.caption),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              height: 32,
              endIndent: 12,
              indent: 12,
              thickness: 1.5,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Material(
                        color: primary100,
                        borderRadius: BorderRadius.circular(30),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(Icons.north_east_rounded,
                              color: Colors.black),
                        ),
                      ),
                      Text('Send', style: Theme.of(context).textTheme.caption),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Material(
                        color: primary100,
                        borderRadius: BorderRadius.circular(30),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(Icons.bar_chart_rounded,
                              color: Colors.black),
                        ),
                      ),
                      Text('History',
                          style: Theme.of(context).textTheme.caption),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Material(
                        color: primary100,
                        borderRadius: BorderRadius.circular(30),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(Icons.qr_code, color: Colors.black),
                        ),
                      ),
                      Text('QR-Code',
                          style: Theme.of(context).textTheme.caption),
                    ],
                  ),
                ],
              ),
            ),
          ],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
  }
}
