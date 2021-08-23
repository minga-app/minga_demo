import 'package:flutter/material.dart';

class OfferTile extends StatelessWidget {
  final String image;
  final String title;
  final String location;
  final num points;

  const OfferTile({
    required this.image,
    required this.title,
    required this.location,
    required this.points,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Image.network(
              image,
              height: 100,
              fit: BoxFit.contain,
            ),
            title: Text(title),
            subtitle: Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 18,
                  color: Colors.grey[600],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(location),
                ),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${points.round()}',
                  style: TextStyle(color: Colors.lightGreen[400], fontSize: 18),
                ),
                Icon(Icons.eco, color: Colors.lightGreen[400])
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: ButtonBar(
              children: [
                RaisedButton.icon(
                  elevation: 0,
                  disabledElevation: 0,
                  highlightElevation: 1,
                  onPressed: () {},
                  label: Text('Claim'),
                  icon: Icon(Icons.shopping_basket, size: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
