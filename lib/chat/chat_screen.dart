import 'package:flutter/material.dart';
import 'package:minga_demo/theme.dart';
import 'package:minga_demo/widgets/app_bar.dart';

class ChatScreen extends StatelessWidget {
  static String route = '/chat';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageAppBar(context, 'Community'),
      body: SafeArea(
          child: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            ChatItem(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
              leading: true,
              left: true,
              shortLabel: 'LH',
              color: Colors.green[800],
            ),
            ChatItem(
              'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
              leading: true,
              left: false,
              shortLabel: 'AK',
              color: Colors.blue[800],
            ),
            ChatItem(
              'Excepteur sint occaecat cupidatat',
              leading: true,
              left: true,
              shortLabel: 'LH',
              color: Colors.green[800],
            ),
            ChatItem(
              'non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              left: true,
              shortLabel: 'LH',
              color: Colors.green[800],
            ),
          ],
        ),
      )),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String text;
  final bool left;
  final bool leading;
  final Color? color;
  final String shortLabel;
  const ChatItem(
    this.text, {
    this.left = true,
    this.leading = false,
    required this.color,
    required this.shortLabel,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          EdgeInsets.only(left: 16, right: 16, top: leading ? 16 : 0),
      title: Container(
        padding: EdgeInsets.all(12),
        constraints: BoxConstraints(maxWidth: 300),
        decoration: BoxDecoration(
            color: primary100,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
              bottomLeft: left ? Radius.zero : Radius.circular(8),
              bottomRight: left ? Radius.circular(8) : Radius.zero,
            )),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                text ?? 'Empty',
                overflow: TextOverflow.ellipsis,
                maxLines: 50,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Thu,\n20:35',
                maxLines: 2,
                style: TextStyle(
                  color: primary200,
                  fontSize: 12,
                ),
              ),
            )
          ],
        ),
      ),
      trailing: leading && !left
          ? Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  shortLabel ?? 'VN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            )
          : null,
      leading: leading && left
          ? Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  shortLabel ?? 'VN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
