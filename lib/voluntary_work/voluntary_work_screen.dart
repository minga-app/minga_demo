import 'package:flutter/material.dart';
import 'package:minga_demo/theme.dart';
import 'package:minga_demo/voluntary_work/voluntary_work_tile.dart';
import 'package:minga_demo/widgets/app_bar.dart';
import 'package:minga_demo/widgets/page_body.dart';
import 'package:minga_demo/widgets/responsive_body.dart';
import 'package:minga_shared/voluntary_work/voluntary_work_model.dart';
import 'package:turf/helpers.dart';

import '../main.dart';

class VoluntaryWorkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        context,
        icon: Icons.directions_bike,
        title: MingaLocalizations.of(context).help,
      ),
      extendBodyBehindAppBar: true,
      body: PageBodyWithNav(
        navItems: [
          NavbarItem(
            label: MingaLocalizations.of(context).h_my_shifts,
            value: 0,
            icon: Icon(Icons.event_available),
          ),
          NavbarItem(
            label: MingaLocalizations.of(context).h_apply,
            value: 1,
            icon: Icon(Icons.date_range),
          ),
        ],
        items: [
          _MyShifts(),
          _Apply(),
        ],
        fabItems: [null, null],
      ),
    );
  }
}

class _Apply extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleColumnBody(children: [
      ApplicationVoluntaryWorkTile(
        model: VoluntaryWorkModel(
          label: MingaLocalizations.of(context).deliver,
          description: '20 kgs ${MingaLocalizations.of(context).of_} Salad',
          startLocation: Feature<Point>(
            geometry: Point(
              coordinates: Position(-70.9144599, -33.418836),
            ),
            fields: {'place_name': 'Lo Prado'},
          ).toJson(),
          endLocation: Feature<Point>(
            geometry: Point(coordinates: Position(-70.5356302, -33.3422959)),
            fields: {'place_name': 'Santiago East'},
          ).toJson(),
          type: VoluntaryWorkType.delivery,
          created: DateTime.now().add(Duration(days: 2)),
          impactPoints: 15,
        ),
      ),
      ApplicationVoluntaryWorkTile(
        model: VoluntaryWorkModel(
          label: MingaLocalizations.of(context).serve_food,
          description: 'Serve Meals at the center',
          startLocation: Feature<Point>(
            geometry: Point(
              coordinates: Position(-70.9144599, -33.418836),
            ),
            fields: {'place_name': 'Santiago West'},
          ).toJson(),
          type: VoluntaryWorkType.serveFood,
          created: DateTime.now().add(Duration(days: 2)),
          impactPoints: 12,
        ),
      ),
    ]);
  }
}

class _MyShifts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleColumnBody(
      children: [
        VoluntaryWorkTile(
          model: VoluntaryWorkModel(
            label: MingaLocalizations.of(context).deliver,
            description:
                '60 pieces ${MingaLocalizations.of(context).of_} Salad',
            startLocation: Feature<Point>(
              geometry: Point(
                coordinates: Position(-70.9144599, -33.418836),
              ),
              fields: {'place_name': 'Santiago West'},
            ).toJson(),
            endLocation: Feature<Point>(
              geometry: Point(coordinates: Position(-70.5356302, -33.3422959)),
              fields: {'place_name': 'Santiago East'},
            ).toJson(),
            type: VoluntaryWorkType.delivery,
            to: DateTime.now().add(Duration(days: 1)),
            from: DateTime.now().subtract(Duration(hours: 8)),
            created: DateTime.now().subtract(Duration(hours: 8)),
            impactPoints: 20,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32, bottom: 8),
          child: Text(
            MingaLocalizations.of(context).previous_work,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: primary200),
          ),
        ),
        SmallVoluntaryWorkTile(
          model: VoluntaryWorkModel(
            label: MingaLocalizations.of(context).delivered,
            description: '20 kgs ${MingaLocalizations.of(context).of_} Bananas',
            startLocation: Feature<Point>(
              geometry: Point(
                coordinates: Position(-70.9144599, -33.418836),
              ),
              fields: {'place_name': 'Lo Prado'},
            ).toJson(),
            endLocation: Feature<Point>(
              geometry: Point(coordinates: Position(-70.5356302, -33.3422959)),
              fields: {'place_name': 'Santiago East'},
            ).toJson(),
            type: VoluntaryWorkType.delivery,
            created: DateTime.now().subtract(Duration(days: 2)),
            impactPoints: 12,
          ),
        ),
        SmallVoluntaryWorkTile(
          model: VoluntaryWorkModel(
            label: MingaLocalizations.of(context).served_food,
            description: 'Served meals at the center',
            startLocation: Feature<Point>(
              geometry: Point(
                coordinates: Position(-70.9144599, -33.418836),
              ),
              fields: {'place_name': 'Santiago West'},
            ).toJson(),
            type: VoluntaryWorkType.serveFood,
            created: DateTime.now().subtract(Duration(days: 3)),
            impactPoints: 15,
          ),
        ),
        SmallVoluntaryWorkTile(
          model: VoluntaryWorkModel(
            label: MingaLocalizations.of(context).delivered,
            description: '10 kgs ${MingaLocalizations.of(context).of_} Bananas',
            startLocation: Feature<Point>(
              geometry: Point(
                coordinates: Position(-70.9144599, -33.418836),
              ),
              fields: {'place_name': 'Santiago West'},
            ).toJson(),
            endLocation: Feature<Point>(
              geometry: Point(coordinates: Position(-70.5356302, -33.3422959)),
              fields: {'place_name': 'Santiago East'},
            ).toJson(),
            type: VoluntaryWorkType.delivery,
            created: DateTime.now().subtract(Duration(days: 8)),
            impactPoints: 20,
          ),
        ),
        SmallVoluntaryWorkTile(
          model: VoluntaryWorkModel(
            label: MingaLocalizations.of(context).delivered,
            description:
                '40 kgs ${MingaLocalizations.of(context).of_} Potatoes',
            startLocation: Feature<Point>(
              geometry: Point(
                coordinates: Position(-70.9144599, -33.418836),
              ),
              fields: {'place_name': 'Macul'},
            ).toJson(),
            endLocation: Feature<Point>(
              geometry: Point(coordinates: Position(-70.5356302, -33.3422959)),
              fields: {'place_name': 'Santiago East'},
            ).toJson(),
            type: VoluntaryWorkType.delivery,
            created: DateTime.now().subtract(Duration(days: 9)),
            impactPoints: 12,
          ),
        ),
      ],
      scrollView: true,
    );
  }
}
