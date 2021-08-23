import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minga_demo/chat/chat_screen.dart';
import 'package:minga_demo/theme.dart';
import 'package:minga_demo/home/navigation_cubit.dart';
import 'package:minga_demo/impact/impact_screen.dart';

import '../main.dart';
import 'menu_screen.dart';

class DefaultAppBar extends AppBar {
  final BuildContext context;

  DefaultAppBar(
    this.context, {
    required IconData icon,
    required String title,
    Widget? bottom,
  }) : super(
          brightness: Brightness.light,
          backgroundColor: Colors.transparent,
          centerTitle: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                'assets/logo.png',
                height: 32,
                width: 32,
              ),
              Text(
                'MINGA',
                style: GoogleFonts.montserrat(color: primary),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 550,
                minWidth: 300,
                maxHeight: double.infinity,
              ),
              padding: EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 16),
                      padding: EdgeInsets.only(
                          left: 12, right: 12, top: 4, bottom: 4),
                      child: Text(title,
                          style: Theme.of(context).textTheme.headline5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: primary100,
                      ),
                    ),
                  ),
                  if (bottom != null) bottom
                ],
              ),
            ),
          ),
          actions: [
            Tooltip(
              message: MingaLocalizations.of(context).impact,
              child: IconButton(
                  icon: Icon(
                    Icons.eco,
                    color: primary,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ImpactScreen()));
                  }),
            ),
            Tooltip(
              message: MingaLocalizations.of(context).community,
              child: IconButton(
                icon: Icon(
                  Icons.chat,
                  color: primary,
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => ChatScreen()));
                },
              ),
            ),
            Tooltip(
              message: MingaLocalizations.of(context).menu,
              child: IconButton(
                  icon: Icon(
                    Icons.dashboard,
                    color: primary,
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (_) => Align(
                        alignment: Alignment.bottomCenter,
                        child: MenuScreen(
                            nav: BlocProvider.of<NavigationCubit>(context)),
                      ),
                    );
                  }),
            ),
          ],
        );
}

class PageAppBar extends AppBar {
  final Function? onPressed;

  PageAppBar(BuildContext context, String? title, {this.onPressed})
      : super(
          brightness: Brightness.dark,
          title: Text(title ?? 'New page'),
          centerTitle: true,
          leading: BackButton(
            onPressed: () {
              if (onPressed != null) {
                onPressed();
              } else {
                Navigator.maybePop(context);
              }
            },
          ),
        );
}
