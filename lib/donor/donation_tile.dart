import 'package:flutter/material.dart';
import 'package:minga_demo/main.dart';
import 'package:minga_demo/theme.dart';
import 'package:minga_demo/widgets/donation_progress_widget.dart';

class DonationTile extends StatelessWidget {
  final String? label;
  final bool delivered;

  const DonationTile({this.label, this.delivered = false});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 8, bottom: 8),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.only(top: 8, left: 16, right: 16),
            leading: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 75),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  'assets/bananas.jpg',
                ),
              ),
            ),
            title: Text(
              'Bananas',
              style: Theme.of(context).textTheme.headline5,
            ),
            trailing: Chip(
              label: Text('~ 18 kg'),
              backgroundColor: primary100,
            ),
          ),
          if (!delivered)
            Container(
              constraints: BoxConstraints(maxWidth: 350),
              padding: EdgeInsets.only(left: 8, right: 8),
              child: MiniDonationProgress(),
            ),
          if (delivered)
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 8.0),
                child: Chip(
                  backgroundColor: primary200,
                  label: Text(MingaLocalizations.of(context).delivered),
                  avatar: Icon(
                    Icons.done,
                    color: Colors.black,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
