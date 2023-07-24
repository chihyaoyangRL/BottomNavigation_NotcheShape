import 'package:flutter/material.dart';

class FABBottomAppBarItem {
  String text;
  IconData iconData;

  FABBottomAppBarItem({required this.iconData, required this.text});
}

class FABBottomAppBar extends StatefulWidget {
  FABBottomAppBar({required this.items, this.centerItemText: '', this.height: 60.0, this.iconSize: 24.0, this.backgroundColor: Colors.blue, required this.color, required this.selectedColor, required this.notchedShape, required this.onTabSelected}) {
    assert(this.items.length == 2 || this.items.length == 4);
  }

  final Color color, selectedColor, backgroundColor;
  final String centerItemText;
  final double height, iconSize;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;
  final List<FABBottomAppBarItem> items;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) => _buildTabItem(item: widget.items[index], index: index, onPressed: _updateIndex));
    items.insert(items.length >> 1, _buildMiddleTabItem());
    return BottomAppBar(
      shape: widget.notchedShape,
      color: widget.backgroundColor,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: widget.iconSize),
              Text((widget.centerItemText.isNotEmpty) ? widget.centerItemText : '', style: TextStyle(color: widget.color)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem({required FABBottomAppBarItem item, required int index, required ValueChanged<int> onPressed}) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Icon(item.iconData, color: color, size: widget.iconSize), Text(item.text, style: TextStyle(color: color))],
              ),
            ),
          ),
        ),
      ),
    );
  }
}