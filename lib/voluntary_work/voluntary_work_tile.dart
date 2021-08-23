import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:minga_demo/theme.dart';
import 'package:minga_demo/widgets/save_button.dart';
import 'package:minga_shared/utils/location_service.dart';
import 'package:minga_shared/voluntary_work/voluntary_work_model.dart';
import 'package:turf/helpers.dart';

import '../main.dart';

class VoluntaryWorkTile extends StatefulWidget {
  final VoluntaryWorkModel model;

  const VoluntaryWorkTile({required this.model});

  @override
  _VoluntaryWorkTileState createState() => _VoluntaryWorkTileState();
}

class _VoluntaryWorkTileState extends State<VoluntaryWorkTile> {
  late Feature<Point> start;
  late Feature<Point> end;
  bool _pickedUp = false;
  @override
  void initState() {
    super.initState();
    start = Feature<Point>.fromJson(widget.model.startLocation);
    end = Feature<Point>.fromJson(widget.model.endLocation);
  }

  String _buildLocationImage() {
    return LocationImageService()
        .getDirectionsImage(start.geometry, end.geometry);
  }

  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: primary100,
      child: Column(
        children: [
          ListTile(
            title: Text(
              widget.model.label,
              style: Theme.of(context).textTheme.headline5,
            ),
            subtitle: Text(widget.model.description),
            trailing: Chip(
              backgroundColor: Colors.white10,
              label: Text(
                  '+${widget.model.impactPoints} ${MingaLocalizations.of(context).points}'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                height: 100,
                child: Image.network(
                  _buildLocationImage(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Wrap(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text((start.fields['place_name'] ?? '')),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Icon(Icons.arrow_right_alt),
                ),
                Text((end.fields['place_name'] ?? ''))
              ],
            ),
          ),
          Divider(),
          ListTile(
            leading: Text('1.', style: TextStyle(fontSize: 18)),
            dense: true,
            title: Text(
              '${MingaLocalizations.of(context).can_be_picked_up} 11:00',
              style: Theme.of(context).textTheme.caption,
            ),
            trailing: SaveButton(
              label: Text('Picked up'),
              icon: Icon(Icons.directions_bike),
              onPressed: () async {
                await Future.delayed(Duration(milliseconds: 1500));
                setState(() {
                  _pickedUp = true;
                });
              },
              initialValue: _pickedUp,
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              dense: true,
              leading: Text('2.', style: TextStyle(fontSize: 18)),
              title: Text(
                '${MingaLocalizations.of(context).must_be_delivered} 12 hours',
                style: Theme.of(context).textTheme.caption,
              ),
              trailing: SaveButton(
                label: Text('Delivered '),
                icon: Icon(Icons.schedule),
                initialValue: false,
                onPressed: () async {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SmallVoluntaryWorkTile extends StatefulWidget {
  final VoluntaryWorkModel model;

  const SmallVoluntaryWorkTile({required this.model});

  @override
  _SmallVoluntaryWorkTileState createState() => _SmallVoluntaryWorkTileState();
}

class _SmallVoluntaryWorkTileState extends State<SmallVoluntaryWorkTile> {
  late Feature<Point> start;
  late Feature<Point> end;
  @override
  void initState() {
    super.initState();
    start = Feature<Point>.fromJson(widget.model.startLocation);
    if (widget.model.type == VoluntaryWorkType.delivery) {
      end = Feature<Point>.fromJson(widget.model.endLocation);
    }
  }

  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 8),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ListTile(
                  dense: true,
                  title: Text(
                    widget.model.label,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(widget.model.description),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Chip(
                      backgroundColor: Colors.grey[200],
                      label: Text(
                        DateFormat('MMM dd').format(widget.model.created),
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                    Chip(
                      backgroundColor: primary100,
                      label: Text(
                          '+${widget.model.impactPoints} ${MingaLocalizations.of(context).points}'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Wrap(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Icon(
                    Icons.location_on,
                    color: primary200,
                    size: 20,
                  ),
                ),
                Text((start.fields['place_name'] ?? '')),
                if (widget.model.type == VoluntaryWorkType.delivery)
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Icon(Icons.arrow_right_alt),
                  ),
                if (widget.model.type == VoluntaryWorkType.delivery)
                  Text((end.fields['place_name'] ?? ''))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ApplicationVoluntaryWorkTile extends StatefulWidget {
  final VoluntaryWorkModel model;

  const ApplicationVoluntaryWorkTile({required this.model});

  @override
  _ApplicationVoluntaryWorkTileState createState() =>
      _ApplicationVoluntaryWorkTileState();
}

class _ApplicationVoluntaryWorkTileState
    extends State<ApplicationVoluntaryWorkTile> {
  late Feature<Point> start;
  late Feature<Point> end;
  @override
  void initState() {
    super.initState();
    start = Feature<Point>.fromJson(widget.model.startLocation);
    if (widget.model.type == VoluntaryWorkType.delivery) {
      end = Feature<Point>.fromJson(widget.model.endLocation);
    }
  }

  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 8),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ListTile(
                  dense: true,
                  title: Text(
                    widget.model.label,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(widget.model.description),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Chip(
                        backgroundColor: Colors.grey[200],
                        label: Text(
                          DateFormat('MMM dd').format(widget.model.created),
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                    ),
                    Chip(
                      backgroundColor: primary100,
                      label: Text('+${widget.model.impactPoints} Points'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Wrap(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Icon(
                    Icons.location_on,
                    color: primary200,
                    size: 20,
                  ),
                ),
                Text((start.fields['place_name'] ?? '')),
                if (widget.model.type == VoluntaryWorkType.delivery)
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Icon(Icons.arrow_right_alt),
                  ),
                if (widget.model.type == VoluntaryWorkType.delivery)
                  Text((end.fields['place_name'] ?? ''))
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.close,
                    color: primary200,
                  ),
                  label: Text(
                    'Not interested',
                    style: TextStyle(
                      color: primary200,
                    ),
                  ),
                ),
                RaisedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.emoji_people),
                  label: Text('Apply'),
                  elevation: 0,
                  disabledElevation: 0,
                  highlightElevation: 0,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
