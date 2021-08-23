import 'package:flutter/material.dart';
import 'package:minga_shared/center/inventory_model.dart';

class InventoryView extends StatelessWidget {
  final List<InventoryItemModel> items;

  const InventoryView(this.items);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, i) => InventoryTile(items[i]),
      itemCount: items.length,
    );
  }
}

class InventoryTile extends StatelessWidget {
  final InventoryItemModel item;

  const InventoryTile(this.item);
  @override
  Widget build(BuildContext context) => ListTile(title: Text(item.label ?? ''));
}
