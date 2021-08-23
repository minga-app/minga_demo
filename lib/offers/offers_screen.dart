import 'package:flutter/material.dart';
import 'package:minga_demo/offers/offers_tile.dart';
import 'package:minga_demo/widgets/app_bar.dart';
import 'package:minga_demo/widgets/page_body.dart';
import 'package:minga_demo/widgets/responsive_body.dart';

enum NavSelection { offers, centers }

class OffersScreen extends StatefulWidget {
  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(context, icon: Icons.restaurant, title: 'Benefit'),
      extendBodyBehindAppBar: true,
      body: PageBodyWithNav(
        navItems: [
          NavbarItem(
            label: 'offers',
            value: 0,
            icon: Icon(Icons.shopping_basket),
          ),
          NavbarItem(
            label: 'centers',
            value: 2,
            icon: Icon(Icons.location_searching),
          ),
        ],
        items: [
          _Offers(),
          _CentersMap(),
        ],
        fabItems: [null, null],
      ),
    );
  }
}

class _CentersMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _Offers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleColumnBody(
      scrollView: false,
      children: [
        Container(
          height: 40,
          margin: EdgeInsets.only(bottom: 8),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: ChoiceChip(
                    label: Text('All Categories',
                        style: TextStyle(color: Colors.black)),
                    selected: true,
                  )),
              VerticalDivider(
                thickness: 1.5,
                endIndent: 4,
                indent: 4,
                width: 32,
              ),
              ChoiceChip(label: Text('Meals'), selected: false),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: ChoiceChip(label: Text('Groceries'), selected: false),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: ChoiceChip(label: Text('Non-food'), selected: false),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: ChoiceChip(
                    label: Text('Sanitary Products'), selected: false),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              OfferTile(
                image: 'https://pngimg.com/uploads/pasta/pasta_PNG91.png',
                location: 'Santiago East',
                points: 7,
                title: 'Spaghetti',
              ),
              OfferTile(
                image: 'https://pngimg.com/uploads/bread/bread_PNG2318.png',
                location: 'Santiago West',
                points: 6,
                title: 'Bread, whole grain',
              ),
              OfferTile(
                image: 'https://pngimg.com/uploads/apple/apple_PNG12503.png',
                location: 'Santiago West',
                points: 3,
                title: 'Apples',
              ),
              OfferTile(
                image: 'https://pngimg.com/uploads/soup/soup_PNG105.png',
                location: 'Santiago East',
                points: 5,
                title: 'Vegetable stew',
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 72),
                child: OfferTile(
                  image:
                      'https://pngimg.com/uploads/medical_mask/medical_mask_PNG43.png',
                  location: 'Santiago West',
                  points: 23,
                  title: '50 masks',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
