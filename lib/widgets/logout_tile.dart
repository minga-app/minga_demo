import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../main.dart';

class LogoutTile extends StatelessWidget {
  const LogoutTile();
  String _buildLabel(String displayName) => displayName.splitMapJoin(' ',
      onNonMatch: (v) => v.characters.first.toUpperCase(), onMatch: (v) => '');

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Juan Nadie'),
      subtitle: Text(MingaLocalizations.of(context).logged_in),
      trailing: Tooltip(
          message: MingaLocalizations.of(context).log_out,
          child: IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      leading: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: Colors.blue[800],
          borderRadius: BorderRadius.circular(22.5),
        ),
        child: Center(
          child: Text(
            _buildLabel('Juan Nadie'),
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}
