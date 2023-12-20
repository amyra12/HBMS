import 'package:flutter/material.dart';

class ColorItem {
  ColorItem(this.name, this.color);
  final String name;
  final Color color;
}



class dropdown extends StatefulWidget {
  dropdown({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _dropdown createState() => _dropdown();
}

class _dropdown extends State<dropdown> {
  final List<ColorItem> items = [
    ColorItem("green", Colors.green),
    ColorItem("yellow", Colors.yellow),
    ColorItem("blue", Colors.blue),
  ];
  late ColorItem currentChoice;

  @override
  void initState() {
    currentChoice = items[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              Icons.face,
              color: currentChoice.color,
              size: 100.0,
            ),
            DropdownButton(
              isExpanded: true,
              style: Theme.of(context).textTheme.headline6,
              value: currentChoice,
              items: items
                  .map<DropdownMenuItem<ColorItem>>(
                    (ColorItem item) => DropdownMenuItem<ColorItem>(
                  value: item,
                  child: Center(child: Text(item.name)),
                ),
              )
                  .toList(),
              onChanged: (ColorItem? value) =>
                  setState(() => currentChoice = value!),
            ),
          ],
        ),
      ),
    );
  }
}
