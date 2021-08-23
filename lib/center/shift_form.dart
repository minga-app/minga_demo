import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:minga_demo/helper/form_spacing.dart';
import 'package:minga_demo/theme.dart';
import 'package:minga_demo/widgets/app_bar.dart';
import 'package:minga_demo/widgets/card_body.dart';
import 'package:minga_demo/widgets/location_selector.dart';
import 'package:minga_shared/voluntary_work/voluntary_work_model.dart';

import '../main.dart';

class ShiftForm extends StatefulWidget {
  @override
  _ShiftFormState createState() => _ShiftFormState();
}

class _ShiftFormState extends State<ShiftForm> {
  late PageController _pageController;
  VoluntaryWorkModel _model = VoluntaryWorkModel(
    type: '',
    created: DateTime.now(),
    label: '',
    description: '',
  );
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageAppBar(context, MingaLocalizations.of(context).new_shift),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          _CategoryView(
            onSelected: (type) {
              setState(() {
                _model.type = type;
                _model.label = voluntaryWorkLabels[_model.type] ?? _model.type;
              });
              _pageController.animateToPage(1,
                  duration: Duration(milliseconds: 200), curve: Curves.linear);
            },
          ),
          _Form(model: _model),
        ],
      ),
    );
  }
}

class _Form extends StatelessWidget {
  const _Form({
    required this.model,
  });

  final VoluntaryWorkModel model;

  @override
  Widget build(BuildContext context) {
    return CardBody(
      child: Form(
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.done,
                color: primary,
                size: 32,
              ),
              title: Text(voluntaryWorkLabels[model.type] ?? model.type),
              subtitle: Text(MingaLocalizations.of(context).category),
            ),
            Divider(
              thickness: 1.5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  FormFieldSpacing(
                    divided: false,
                    title: MingaLocalizations.of(context).summary,
                    child: TextFormField(
                      initialValue: model.label + ' ...',
                    ),
                  ),
                  FormFieldSpacing(
                    title: MingaLocalizations.of(context).desc,
                    child: TextFormField(
                      maxLines: 5,
                      minLines: 2,
                    ),
                    divided: false,
                  ),
                  FormFieldSpacing(
                    divided: false,
                    title: MingaLocalizations.of(context).impact_points,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 12),
                          child: Icon(
                            Icons.eco,
                            color: Colors.lightGreen[400],
                            size: 32,
                          ),
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: TextFormField(
                            initialValue: '15',
                          ),
                        )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.event,
                        size: 32,
                      ),
                      title: Text(DateFormat.yMMMEd()
                          .format(DateTime.now().add(Duration(days: 1)))),
                      subtitle: Text(MingaLocalizations.of(context).date),
                      onTap: () {},
                      trailing: Icon(Icons.edit),
                    ),
                  ),
                  FormFieldSpacing(
                      divided: false,
                      child: LocationSelector(onSelect: (y) {})),
                  if (model.type == VoluntaryWorkType.delivery)
                    LocationSelector(onSelect: (y) {}),
                ],
              ),
            ),
            Divider(
              thickness: 1.5,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, bottom: 8),
              child: ButtonBar(
                buttonHeight: 48,
                children: [
                  RaisedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.done),
                    label: Text('Save'),
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
    );
  }
}

class _CategoryView extends StatefulWidget {
  final Function(String type) onSelected;
  const _CategoryView({
    required this.onSelected,
  });

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<_CategoryView> {
  late TextEditingController _typeController;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.all(16),
          sliver: SliverGrid.extent(
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
            maxCrossAxisExtent: 150,
            children: [
              _CategoryCard(
                color: primary200,
                icon: Icons.directions_bike,
                label: MingaLocalizations.of(context).deliver,
                onSelected: () => widget.onSelected(VoluntaryWorkType.delivery),
              ),
              _CategoryCard(
                color: primary200,
                icon: Icons.outdoor_grill,
                label: MingaLocalizations.of(context).prep_food,
                onSelected: () =>
                    widget.onSelected(VoluntaryWorkType.prepareFood),
              ),
              _CategoryCard(
                color: primary200,
                icon: Icons.food_bank,
                label: MingaLocalizations.of(context).serve_food,
                onSelected: () =>
                    widget.onSelected(VoluntaryWorkType.serveFood),
              ),
              _CategoryCard(
                color: primary100,
                icon: Icons.cleaning_services,
                label: MingaLocalizations.of(context).cleaning,
                onSelected: () => widget.onSelected(VoluntaryWorkType.clean),
              ),
              _CategoryCard(
                color: primary100,
                icon: Icons.construction,
                label: MingaLocalizations.of(context).repair,
                onSelected: () => widget.onSelected(VoluntaryWorkType.repair),
              ),
              _CategoryCard(
                color: primary100,
                icon: Icons.eco,
                label: MingaLocalizations.of(context).garden,
                onSelected: () =>
                    widget.onSelected(VoluntaryWorkType.gardening),
              ),
              _CategoryCard(
                color: primary100,
                icon: Icons.assignment,
                label: MingaLocalizations.of(context).coord,
                onSelected: () =>
                    widget.onSelected(VoluntaryWorkType.coordinate),
              ),
              _CategoryCard(
                color: primary100,
                icon: Icons.healing,
                label: MingaLocalizations.of(context).health,
                onSelected: () =>
                    widget.onSelected(VoluntaryWorkType.healthcare),
              ),
              _CategoryCard(
                color: primary100,
                icon: Icons.school,
                label: MingaLocalizations.of(context).teach,
                onSelected: () => widget.onSelected(VoluntaryWorkType.teaching),
              ),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 8, right: 16, left: 16),
                        child: FormFieldSpacing(
                          divided: false,
                          child: TextFormField(
                            controller: _typeController,
                            validator: (val) => val!.length > 5
                                ? null
                                : MingaLocalizations.of(context).at_least_5,
                          ),
                          title: MingaLocalizations.of(context).alt_cat,
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1.5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, bottom: 8),
                      child: ButtonBar(
                        children: [
                          RaisedButton.icon(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                widget.onSelected(_typeController.text);
                              }
                            },
                            icon: Icon(Icons.arrow_forward),
                            label: Text(MingaLocalizations.of(context).proceed),
                            elevation: 0,
                            highlightElevation: 0,
                            disabledElevation: 0,
                          )
                        ],
                        buttonHeight: 48,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ],
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback? onSelected;
  const _CategoryCard({
    required this.icon,
    required this.label,
    required this.color,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32,
            ),
            Text(
              label,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
