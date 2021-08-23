import 'dart:async';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minga_demo/helper/form_spacing.dart';
import 'package:minga_demo/theme.dart';

import 'package:minga_demo/widgets/card_body.dart';
import 'package:minga_demo/widgets/location_selector.dart';
import 'package:minga_demo/widgets/selection_tile.dart';
import 'package:minga_shared/product_category/product_category.dart';
import 'package:minga_shared/product_category/product_category_bloc.dart';
import 'package:minga_shared/utils/location_service.dart';
import 'package:turf/helpers.dart';

import '../main.dart';

class DonationForm extends StatefulWidget {
  @override
  _DonationFormState createState() => _DonationFormState();
}

class _DonationFormState extends State<DonationForm> {
  final _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MingaLocalizations.of(context).new_donation),
      ),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            CardBody(
              child: Column(
                children: [
                  _Form(),
                  Divider(thickness: 1.5),
                  ButtonBar(
                    buttonPadding:
                        EdgeInsets.only(left: 16, bottom: 16, right: 16),
                    buttonHeight: 48,
                    children: [
                      RaisedButton.icon(
                        elevation: 0,
                        highlightElevation: 1,
                        onPressed: () {
                          _pageController.nextPage(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.linear);
                        },
                        icon: Icon(Icons.check),
                        label: Text(MingaLocalizations.of(context).donate),
                      )
                    ],
                  )
                ],
              ),
            ),
            CardBody(child: _AssignCenterScreen()),
          ],
        ),
      ),
    );
  }
}

class _AssignCenterScreen extends StatefulWidget {
  @override
  _AssignCenterScreenState createState() => _AssignCenterScreenState();
}

class _AssignCenterScreenState extends State<_AssignCenterScreen> {
  Timer? _timer;
  bool _loading = true;
  double _opacity = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(milliseconds: 1500), () {
      setState(() {
        _loading = false;
        _opacity = 1.0;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              title: Text(MingaLocalizations.of(context).select_center),
              trailing: Container(
                height: 40,
                width: 40,
                child: _loading
                    ? CircularProgressIndicator()
                    : Icon(
                        Icons.check,
                        size: 40,
                        color: primary200,
                      ),
              ),
              subtitle: Text(_loading ? '' : 'Santiago West'),
            ),
            AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(milliseconds: 500),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      height: 100,
                      child: Image.network(
                        _buildLocationImage(),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Divider(),
                  CheckboxListTile(
                    title: Text(MingaLocalizations.of(context).self_deliver),
                    onChanged: _loading
                        ? null
                        : (val) {
                            print(val);
                          },
                    value: false,
                  ),
                ],
              ),
            ),
            ButtonBar(
              buttonHeight: 48,
              children: [
                RaisedButton.icon(
                  elevation: 0,
                  highlightElevation: 1,
                  onPressed: _loading
                      ? null
                      : () {
                          Navigator.pop(context);
                        },
                  icon: Icon(Icons.check),
                  label: Text(MingaLocalizations.of(context).done),
                )
              ],
            ),
          ],
        ),
      );

  String _buildLocationImage() {
    return LocationImageService().getDirectionsImage(
      Point(
        coordinates: Position.named(
          lat: -33.4312226,
          lng: -70.5920118,
        ),
      ),
      Point(
        coordinates: Position.named(
          lat: -33.5149429,
          lng: -70.8961298,
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  _FormState createState() => _FormState();
}

final units = <String>[
  'kg',
  'grams',
  'pieces',
];

class _FormState extends State<_Form> {
  final _autoCompleteKey =
      GlobalKey<AutoCompleteTextFieldState<ProductCategory>>();

  final _labelEditingController = TextEditingController();

  String? _unit = units.first;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          child: Column(
            children: [
              SelectionTile(
                value: false,
                onChanged: (val) {},
                leftLabel: MingaLocalizations.of(context).food,
                rightLabel: MingaLocalizations.of(context).non_food,
              ),
              FormFieldSpacing(
                divided: false,
                child: ListTile(
                  leading: Icon(
                    Icons.add_a_photo,
                    size: 32,
                  ),
                  title: Text(MingaLocalizations.of(context).select_image),
                  subtitle:
                      Text(MingaLocalizations.of(context).select_image_sub),
                  onTap: () {},
                ),
              ),
              FormFieldSpacing(
                title: MingaLocalizations.of(context).choose_type,
                divided: false,
                child: AutoCompleteTextField<ProductCategory>(
                  clearOnSubmit: false,
                  controller: _labelEditingController,
                  key: _autoCompleteKey,
                  itemFilter: (ProductCategory suggestion, input) => suggestion
                      .label
                      .toLowerCase()
                      .startsWith(input.toLowerCase()),
                  itemSorter: (ProductCategory a, ProductCategory b) =>
                      a.label.compareTo(b.label),
                  itemSubmitted: (ProductCategory item) {
                    _labelEditingController.value = TextEditingValue(
                      text: item.label,
                    );
                  },
                  itemBuilder: (context, item) => ListTile(
                    dense: true,
                    contentPadding:
                        EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 6),
                    title: Text(item.label),
                    trailing: Chip(
                      backgroundColor: primary100,
                      label:
                          Text('~ ${item.points}P / ${_printQuantity(item)}'),
                    ),
                  ),
                  suggestions: [],
                  style: Theme.of(context).textTheme.headline5,
                  decoration: InputDecoration(
                      hintText: MingaLocalizations.of(context).label),
                ),
              ),
              FormFieldSpacing(
                divided: false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 6, right: 6, bottom: 8, top: 4),
                        child: Column(
                          children: [
                            Text('Quantity',
                                style: Theme.of(context).textTheme.caption),
                            TextFormField(
                              validator: (val) {
                                if (val?.isEmpty != null) {
                                  return MingaLocalizations.of(context).fill_in;
                                } else if (int.tryParse(val ?? '') == null) {
                                  return 'not a number';
                                }
                                return null;
                              },
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.numberWithOptions(),
                            ),
                          ],
                        ),
                      ),
                      flex: 1,
                    ),
                    Container(
                      width: 1.5,
                      height: 60,
                      color: Colors.black,
                      margin: EdgeInsets.only(bottom: 4),
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 6.0, right: 6.0, top: 4, bottom: 8),
                        child: Column(
                          children: [
                            Text('Unit',
                                style: Theme.of(context).textTheme.caption),
                            DropdownButton<String>(
                              value: _unit,
                              items: [
                                ...units
                                    .map((unit) => DropdownMenuItem(
                                          child: Text(unit),
                                          value: unit,
                                          onTap: () {},
                                        ))
                                    .toList()
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _unit = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              LocationSelector(
                onSelect: (result) {},
              ),
            ],
          ),
        ),
      );
}

// TODO localize donations
_printQuantity(ProductCategory item) {
  var _unitsSingular = {
    'pieces': 'pc.',
    'kg': 'kg',
    'grams': 'gr',
  };
  var _units = {
    'pieces': 'pcs.',
    'kg': 'kg',
    'grams': 'grs',
  };
  print(units);
  return (item.quantity.toInt() == 1)
      ? '1${_unitsSingular[item.unit] ?? item.unit}'
      : '${item.quantity}${_units[item.unit] ?? item.unit}';
}
