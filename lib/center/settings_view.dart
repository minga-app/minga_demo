import 'package:flutter/material.dart';
import 'package:minga_demo/helper/form_spacing.dart';
import 'package:minga_demo/widgets/location_selector.dart';
import 'package:minga_demo/widgets/responsive_body.dart';

import '../main.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleColumnBody(
      scrollView: true,
      children: [
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text('Santiago, East',
                          style: Theme.of(context).textTheme.headline5),
                    ),
                    FormFieldSpacing(
                      child: LocationSelector(onSelect: (v) {}),
                      divided: false,
                    ),
                    FormFieldSpacing(
                      divided: false,
                      title: MingaLocalizations.of(context).desc,
                      child: TextFormField(
                        minLines: 2,
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(thickness: 1.5),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ButtonBar(
                  alignment: MainAxisAlignment.end,
                  children: [
                    RaisedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.done),
                      label: Text(MingaLocalizations.of(context).save),
                      elevation: 0,
                      disabledElevation: 0,
                      highlightElevation: 0,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16),
                child: Text(MingaLocalizations.of(context).admins,
                    style: Theme.of(context).textTheme.headline5),
              ),
              ListTile(
                title: Text('Anke Kessler'),
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'AK',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text('Lukas Himsel'),
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'LH',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 1.5,
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  RaisedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.person_add),
                    label: Text(MingaLocalizations.of(context).invite_user),
                    elevation: 0,
                    disabledElevation: 0,
                    highlightElevation: 0,
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
