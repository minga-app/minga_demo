import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minga_demo/donor/donation_form.dart';
import 'package:minga_demo/main.dart';
import 'package:minga_demo/widgets/app_bar.dart';
import 'package:minga_demo/widgets/responsive_body.dart';
import 'package:minga_shared/product_category/product_category_bloc.dart';

class DonorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: DefaultAppBar(
          context,
          icon: Icons.favorite_border,
          title: 'Donate',
        ),
        extendBodyBehindAppBar: true,
        body: SafeArea(
          child: SingleColumnBody(
            children: [
              Center(
                child: Column(
                  children: [
                    Text(MingaLocalizations.of(context).donate_food,
                        style: Theme.of(context).textTheme.headline5),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => DonationForm()));
          },
          label: Text('Donate'),
          icon: Icon(Icons.add),
        ),
      );
}
