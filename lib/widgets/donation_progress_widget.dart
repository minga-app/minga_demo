import 'package:flutter/material.dart';
import 'package:minga_demo/theme.dart';

class MiniDonationProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: double.infinity,
              height: 12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: primary200,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Stack(
                    children: [
                      Center(
                        child: Icon(
                          Icons.shopping_basket,
                          color: Colors.grey[300],
                          size: 18,
                        ),
                      ),
                      Center(
                        child: Tooltip(
                          message: 'donated 08:30 AM',
                          child: Icon(
                            Icons.done,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: primary200,
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Container(
                  child: Stack(
                    children: [
                      Center(
                        child: Icon(
                          Icons.motorcycle,
                          size: 18,
                          color: Colors.grey[300],
                        ),
                      ),
                      Center(
                        child: Tooltip(
                          message: 'picked up 01:45 PM',
                          child: Icon(
                            Icons.done,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: primary200,
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Container(
                  child: Tooltip(
                    message: 'delivery ETA 02:20 PM',
                    child: Icon(
                      Icons.store,
                      size: 18,
                      color: Colors.grey[800],
                    ),
                  ),
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: primary,
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 22, right: 16),
                    height: 2,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 75),
                    height: 2,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    flex: 1,
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: Icon(
                            Icons.arrow_right,
                            color: Colors.white,
                            size: 24,
                          ),
                        ))),
                Expanded(
                    flex: 1,
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 65),
                          child: Icon(
                            Icons.arrow_right,
                            color: Colors.white,
                            size: 24,
                          ),
                        ))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DonationProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: CustomChip(
                  text: 'Donated',
                  done: true,
                ),
              ),
              Flexible(
                flex: 1,
                child: CustomChip(
                  text: 'Picked up',
                  done: true,
                ),
              ),
              Flexible(
                flex: 1,
                child: CustomChip(text: 'Arriving'),
              ),
            ],
          ),
          Container(
            height: 60,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: double.infinity,
                    height: 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: primary,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Stack(
                          children: [
                            Center(
                              child: Icon(
                                Icons.shopping_basket,
                                color: Colors.grey[300],
                              ),
                            ),
                            Center(
                              child: Icon(
                                Icons.done,
                                size: 28,
                              ),
                            ),
                          ],
                        ),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: primary,
                            width: 4,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Container(
                        child: Stack(
                          children: [
                            Center(
                              child: Icon(
                                Icons.motorcycle,
                                color: Colors.grey[300],
                              ),
                            ),
                            Center(
                              child: Icon(
                                Icons.done,
                                size: 28,
                              ),
                            ),
                          ],
                        ),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: primary,
                            width: 4,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Container(
                        child: Icon(
                          Icons.store,
                          color: Colors.grey[800],
                        ),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: primary,
                            width: 4,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(left: 36, right: 24),
                          height: 3,
                          width: double.infinity,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(left: 16, right: 80),
                          height: 3,
                          width: double.infinity,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Icon(
                                  Icons.arrow_right,
                                  color: Colors.white,
                                  size: 32,
                                ),
                              ))),
                      Expanded(
                          flex: 1,
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 65),
                                child: Icon(
                                  Icons.arrow_right,
                                  color: Colors.white,
                                  size: 32,
                                ),
                              ))),
                    ],
                  ),
                ),
              ],
            ),
          ), /*
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text('08:30 AM'),
                    ),
                    Text('+20 Points'),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text('01:45 PM'),
                    ),
                    Text('+5 Points'),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text('ETA 02:20 PM'),
                    ),
                    Text(''),
                  ],
                ),
              ),
            ],
          ),*/
        ],
      ),
    );
  }
}

class CustomChip extends StatelessWidget {
  final String text;
  final bool done;
  const CustomChip({
    required this.text,
    this.done = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text),
          Padding(
            padding: const EdgeInsets.only(left: 3.0),
            child: Icon(
              done ? Icons.done : Icons.timer,
              size: 16,
            ),
          )
        ],
      ),
      padding: EdgeInsets.only(left: 6, right: 6, top: 3, bottom: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: primary100,
      ),
    );
  }
}
