import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:minga_demo/theme.dart';
import 'package:minga_shared/utils/location_service.dart';
import 'package:turf/turf.dart';

typedef OnSelect = void Function(Feature result);

class LocationSelector extends StatefulWidget {
  final Feature? location;
  final int? width;
  final OnSelect onSelect;

  const LocationSelector({
    this.location,
    this.width,
    required this.onSelect,
  });
  @override
  _LocationSelectorState createState() => _LocationSelectorState(location ??
      Feature(
        fields: {'place_name': 'Santiago Metropolitan Region'},
        geometry: Point(
            coordinates: Position.named(lat: -33.4665279, lng: -70.6757456)),
        id: 'default',
        properties: {},
        bbox: null,
      ));
}

class _LocationSelectorState extends State<LocationSelector> {
  Feature? location;
  late String staticImage;

  _LocationSelectorState(this.location);

  @override
  void initState() {
    super.initState();

    staticImage =
        LocationImageService().getPointImage(location!.geometry as Point);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      constraints: BoxConstraints(maxWidth: 400),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: primary100,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Column(
          children: [
            ListTile(
              dense: true,
              tileColor: primary200,
              title: Text(
                widget.location != null ? 'Change location' : 'Select location',
              ),
              subtitle: Text(
                location?.fields["place_name"] ?? '',
              ),
              leading: Icon(
                Icons.location_searching,
                color: Colors.black,
              ),
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => LocationSelectorSheet(
                          onSelect: (Feature result) {
                            setState(() {
                              location = result;
                            });
                            widget.onSelect(result);
                          },
                        ),
                    backgroundColor: Colors.transparent);
              },
            ),
            Expanded(
              child: Image.network(
                staticImage,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LocationSelectorSheet extends StatefulWidget {
  LocationSelectorSheet({
    this.location,
    this.context,
    required this.onSelect,
  });

  final BuildContext? context;

  final Feature? location;

  final OnSelect onSelect;

  @override
  _LocationSelectorSheetState createState() => _LocationSelectorSheetState();
}

class _LocationSelectorSheetState extends State<LocationSelectorSheet>
    with SingleTickerProviderStateMixin {
  TextEditingController _textEditingController = TextEditingController();

  FeatureCollection results = FeatureCollection(features: []);

  final LocationImageService _positionService;
  Timer? debounceTimer;

  _LocationSelectorSheetState() : _positionService = LocationImageService();

  @override
  void dispose() {
    debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Center(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                      controller: _textEditingController,
                      onChanged: (value) async {
                        debounceTimer?.cancel();
                        debounceTimer = Timer(
                          Duration(milliseconds: 750),
                          () async {
                            await _autocompletePlace(value);
                            if (mounted) {
                              setState(() {});
                            }
                          },
                        );
                      },
                    ),
                  ),
                  Container(width: 15),
                  GestureDetector(
                    child: Icon(Icons.search, color: primary),
                    onTap: () {},
                  )
                ],
              ),
            ),
            Divider(
              height: 2,
              color: primary,
              thickness: 2,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: results.features.length,
                itemBuilder: (context, index) =>
                    _buildResult(results.features[index]),
              ),
            ),
          ],
        ),
      );

  Widget _buildResult(Feature prediction) {
    String place = prediction['text'];
    String fullName = prediction['place_name'];

    return ListTile(
      onTap: () => _selectPlace(prediction),
      title: Text(
        place.length < 45
            ? "$place"
            : "${place.replaceRange(45, place.length, "")} ...",
        maxLines: 1,
      ),
      subtitle: Text(
        fullName,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }

  // Methods
  Future _autocompletePlace(String input) async {
    if (input.length > 0) {
      var predictions = await _positionService.getPlaces(input);
      setState(() {
        results = predictions;
      });
    } else {
      setState(() => results.features.clear());
    }
  }

  void _selectPlace(Feature result) async {
    /// Will be called when a user selects one of the Place options.

    // Sets TextField value to be the location selected
    _textEditingController.value = TextEditingValue(
      text: result['place_name'],
      selection: TextSelection.collapsed(offset: result['place_name'].length),
    );
    widget.onSelect(result);

    Navigator.pop(context);
  }
}
