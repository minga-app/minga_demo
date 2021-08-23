import 'package:flutter/material.dart';
import 'package:minga_demo/main.dart';
import 'package:minga_demo/theme.dart';

import '../home/navigation_cubit.dart';
import '../main.dart';
import '../theme.dart';
import 'logout_tile.dart';

class MenuScreen extends StatelessWidget {
  final NavigationCubit nav;

  const MenuScreen({required this.nav});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              MenuCard(
                  backgroundColor: primary,
                  title: MingaLocalizations.of(context).benefit,
                  subtitle: MingaLocalizations.of(context).benefit_sub,
                  textColor: Colors.white,
                  icon: Icons.restaurant,
                  callback: () {
                    nav.offers();
                    Navigator.pop(context);
                  }),
              MenuCard(
                backgroundColor: primary100,
                title: MingaLocalizations.of(context).help,
                subtitle: MingaLocalizations.of(context).help_sub,
                icon: Icons.directions_bike,
                callback: () {
                  nav.services();
                  Navigator.pop(context);
                },
              ),
              MenuCard(
                backgroundColor: primary200,
                title: MingaLocalizations.of(context).donate,
                subtitle: MingaLocalizations.of(context).donate_sub,
                icon: Icons.favorite_border,
                callback: () {
                  nav.donor();
                  Navigator.pop(context);
                },
              ),
              Flexible(
                fit: FlexFit.loose,
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    children: [
                      MenuCard.small(
                        backgroundColor: primary100,
                        title: MingaLocalizations.of(context).admin,
                        subtitle: MingaLocalizations.of(context).admin_sub,
                        icon: Icons.store,
                        callback: () {
                          nav.center();
                          Navigator.pop(context);
                        },
                      ),
                      MenuCard.small(
                        backgroundColor: primary100,
                        title: MingaLocalizations.of(context).moderate,
                        subtitle: MingaLocalizations.of(context).moderate_sub,
                        icon: Icons.gavel,
                        callback: () {
                          nav.moderator();
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
              LogoutTile(),
              ListTile(
                title: Text(MingaLocalizations.of(context).manage_account),
                subtitle:
                    Text(MingaLocalizations.of(context).manage_account_sub),
                onTap: () {},
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {},
                ),
                leading: Container(
                  color: Colors.white,
                  height: 45,
                  width: 45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final Color? textColor;
  final IconData? icon;
  final bool small;
  final VoidCallback? callback;
  const MenuCard({
    required this.backgroundColor,
    required this.title,
    required this.subtitle,
    this.textColor,
    this.icon,
    required this.callback,
  }) : small = false;

  MenuCard.small({
    required this.backgroundColor,
    required this.title,
    required this.subtitle,
    this.textColor,
    this.icon,
    required this.callback,
  }) : small = true;

  @override
  Widget build(BuildContext context) => Flexible(
        fit: FlexFit.loose,
        flex: 1,
        child: Container(
          constraints: BoxConstraints(minHeight: 130),
          alignment: Alignment.center,
          margin: small
              ? EdgeInsets.all(8)
              : EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
          decoration: BoxDecoration(
              color: backgroundColor, borderRadius: BorderRadius.circular(8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              if (small) Icon(icon, size: 28),
              ListTile(
                onTap: callback,
                leading: small
                    ? null
                    : Icon(
                        icon,
                        size: 32,
                        color: textColor ?? Colors.black,
                      ),
                title: Text(
                  title ?? '',
                  style: TextStyle(
                    color: textColor ?? Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: small ? 20 : 24,
                  ),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    subtitle ?? '',
                    style: TextStyle(
                        color: textColor ?? Colors.black,
                        fontSize: small ? 13 : 15),
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: textColor ?? Colors.black,
                  size: 32,
                ),
              ),
            ],
          ),
        ),
      );
}
