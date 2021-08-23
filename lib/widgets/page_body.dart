import 'package:flutter/material.dart';
import 'package:minga_demo/theme.dart';

typedef _SelectionOnChanged = Function(int value);

class NavbarItem {
  final String label;
  final Icon icon;
  final int value;

  NavbarItem({
    required this.label,
    required this.value,
    required this.icon,
  });
}

class NavBar extends StatefulWidget {
  final int value;
  final _SelectionOnChanged onChanged;
  final List<NavbarItem> items;
  final int initialValue;

  const NavBar({
    required this.value,
    required this.onChanged,
    required this.items,
    required this.initialValue,
  }) : assert(items.length >= 2 && items.length <= 4);

  @override
  _NavBarState createState() => _NavBarState(initialValue, onChanged);
}

class _NavBarState extends State<NavBar> {
  final _SelectionOnChanged onChanged;

  final int initialValue;

  _NavBarState(this.initialValue, this.onChanged);
  late int value;
  @override
  void initState() {
    super.initState();
    value = initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: LayoutBuilder(builder: (context, constraints) {
        return Material(
          elevation: .5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(8)),
          child: Container(
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Stack(
              children: [
                Builder(builder: (_) {
                  var numItems = widget.items.length;
                  print(constraints.maxWidth);
                  var width = constraints.maxWidth / numItems;
                  var pos = widget.items.indexWhere((i) => i.value == value);
                  var endPos = numItems - pos - 1;
                  // 0 - 2
                  // 1 - 1
                  // 2 - 0

                  print('$numItems, $width, ${pos * width}, ${endPos * width}');
                  return AnimatedPositioned(
                    curve: Curves.fastOutSlowIn,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: primary200,
                      ),
                      height: 64,
                      width: width,
                    ),
                    duration: Duration(milliseconds: 500),
                    left: pos * width,
                    right: endPos * width,
                    top: 0,
                  );
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    for (var item in widget.items) _navItem(context, item),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _navItem(BuildContext context, NavbarItem item) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          setState(() {
            value = item.value;
          });
          onChanged(value);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (item.icon != null)
                AnimatedOpacity(
                    opacity: value == item.value ? 1 : 0.64,
                    duration: Duration(milliseconds: 200),
                    child: item.icon),
              Text(
                item.label,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .apply(color: Colors.black),
              ),
            ],
          ),
          padding: EdgeInsets.only(top: 4, bottom: 4),
        ),
      ),
    );
  }
}

class PageBodyWithNav extends StatefulWidget {
  final List<NavbarItem> navItems;
  final List<Widget> items;
  final List<FloatingActionButton?> fabItems;
  final int initialValue;

  const PageBodyWithNav({
    required this.navItems,
    required this.items,
    this.initialValue = 0,
    required this.fabItems,
  })  : assert(navItems.length >= 2),
        assert(items.length == navItems.length);
  @override
  _PageBodyWithNavState createState() => _PageBodyWithNavState();
}

class _PageBodyWithNavState extends State<PageBodyWithNav> {
  late PageController _pageController;
  late int value;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: widget.initialValue);
    value = widget.initialValue;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        top: true,
        bottom: true,
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              children: widget.items,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.grey[100]!.withOpacity(0.65),
                height: 66,
              ),
            ),
            if (widget.fabItems != null)
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 88),
                  child: widget.fabItems[value],
                ),
              ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: NavBar(
                initialValue: widget.initialValue,
                value: value,
                items: widget.navItems,
                onChanged: (int val) {
                  setState(() {
                    value = val;
                  });
                  _pageController.animateToPage(
                    value,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.linear,
                  );
                },
              ),
            ),
          ],
        ),
      );
}
