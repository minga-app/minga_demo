import 'package:firestore_api/firestore_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minga_demo/center/center_screen.dart';
import 'package:minga_demo/donor/donor_screen.dart';
import 'package:minga_demo/offers/offers_screen.dart';
import 'package:minga_demo/voluntary_work/voluntary_work_screen.dart';
import 'package:minga_shared/auth/auth_bloc.dart';
import 'package:minga_shared/product_category/product_category_bloc.dart';
import 'package:minga_shared/product_category/product_category_service.dart';

import 'navigation_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen() : super();
  @override
  Widget build(BuildContext context) {
    return _HomeNavigation();
  }
}

class _HomeNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
      switch (state) {
        case NavigationState.donor:
          return DonorScreen();

        case NavigationState.center:
          return CenterScreen();

        case NavigationState.services:
          return VoluntaryWorkScreen();

        case NavigationState.moderator:
          return Container();
        //TODO return something

        case NavigationState.offers:
        default:
          return OffersScreen();
      }
    });
  }
}
