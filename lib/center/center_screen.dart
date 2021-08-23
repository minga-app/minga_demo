import 'package:flutter/material.dart';
import 'package:minga_demo/center/settings_view.dart';
import 'package:minga_demo/center/shift_form.dart';
import 'package:minga_demo/widgets/app_bar.dart';
import 'package:minga_demo/theme.dart';
import 'package:minga_demo/donor/donation_tile.dart';
import 'package:minga_demo/widgets/responsive_body.dart';
import 'package:minga_demo/widgets/page_body.dart';
import 'package:minga_shared/center/center_model.dart';

import '../main.dart';

class CenterScreen extends StatefulWidget {
  @override
  _CenterScreenState createState() => _CenterScreenState();
}

class _CenterScreenState extends State<CenterScreen> {
  Widget build(BuildContext context) => Scaffold(
        appBar: DefaultAppBar(
          context,
          icon: Icons.store,
          title: MingaLocalizations.of(context).admin,
          bottom: SelectCenterWidget([
            CenterModel(label: 'Santiago, East'),
            CenterModel(label: 'Santiago, West'),
          ]),
        ),
        extendBodyBehindAppBar: true,
        body: PageBodyWithNav(
          items: [
            SingleColumnBody(
              scrollView: true,
              children: [
                Chip(
                  label: Text(MingaLocalizations.of(context).today),
                ),
                DonationTile(),
                Chip(
                  label: Text(MingaLocalizations.of(context).yesterday),
                ),
                DonationTile(
                  delivered: true,
                ),
              ],
            ),
            Container(),
            SettingsView(),
          ],
          navItems: [
            NavbarItem(
                label: MingaLocalizations.of(context).a_deliveries,
                value: 0,
                icon: Icon(Icons.directions_bike)),
            NavbarItem(
                label: MingaLocalizations.of(context).a_helpers,
                value: 1,
                icon: Icon(Icons.emoji_people)),
            NavbarItem(
                label: MingaLocalizations.of(context).a_settings,
                value: 2,
                icon: Icon(Icons.settings)),
          ],
          fabItems: [
            null,
            FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => ShiftForm()));
              },
              label: Text(MingaLocalizations.of(context).shift),
              icon: Icon(Icons.add),
            ),
            null,
          ],
        ),
      );
}

class SelectCenterWidget extends StatelessWidget {
  final List<CenterModel> centers;

  const SelectCenterWidget(this.centers);

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(right: 16),
        padding: EdgeInsets.only(top: 8, bottom: 5, right: 8, left: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: primary100,
        ),
        child: DropdownButton<CenterModel>(
          isExpanded: false,
          items: centers
              .map((c) => DropdownMenuItem<CenterModel>(
                  value: c,
                  child: Text(
                    c.label ?? '',
                    style: TextStyle(color: Colors.black),
                  )))
              .toList(),
          underline: Container(),
          selectedItemBuilder: (_) => centers
              .map<Widget>((c) =>
                  Text(c.label ?? '', style: TextStyle(color: Colors.black)))
              .toList(),
          onChanged: null,
          dropdownColor: primary100,
          iconEnabledColor: Colors.black,
          value: centers.first,
          elevation: 1,
          isDense: true,
        ),
      );
}
