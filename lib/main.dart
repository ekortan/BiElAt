import 'package:flutter/material.dart';
import 'dart:ui' as ui;
class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  // Fields in a Widget subclass are always marked "final".

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0, // in logical pixels
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blueGrey[500]),
      // Row is a horizontal, linear layout.
      child: Row(
        // <Widget> is the type of items in the list.
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, // null disables the button
          ),
          // Expanded expands its child to fill the available space.
          Expanded(
            child: title,
          ),
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  List<String> _locations = ['Yiyecek', 'Kıyafet', 'Ulaşım']; // Option 2
  String _selectedLocation; // Option 2
  List<String> _locationss = ['1', '2', '3','4','5']; // Option 2
  String _selectedLocations; // Option 2
  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece of paper on which the UI appears.
    return Material(
      // Column is a vertical, linear layout.
      child: Column(
        children: <Widget>[
          MyAppBar(
            title: Text(
              'İhtiyacını iste',
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
          ),
          Expanded(
            child: FittedBox(
              fit: BoxFit.contain, // otherwise the logo will be tiny
              child: Image(image: AssetImage('assets/hands.jpg')),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                children: <Widget>[
                  Text('Bi el at',style: TextStyle(fontSize: 40,foreground: Paint()
                    ..shader = ui.Gradient.linear(
                      const Offset(100, 150),
                      const Offset(250, 20),
                      <Color>[
                        Colors.black54,
                        Colors.blue,
                      ],
                    ))),

                  DropdownButton(
                    hint: Text('İhtiyaç çeşidi seçin'), // Not necessary for Option 1
                    value: _selectedLocation,
                    onChanged: (newValue) {

                    },
                    items: _locations.map((location) {
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),

                  DropdownButton(
                    hint: Text('Adet seçin'), // Not necessary for Option 1
                    value: _selectedLocations,
                    onChanged: (newValue) {

                    },
                    items: _locationss.map((location) {
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),

    TextFormField(
    decoration: InputDecoration(
    labelText: 'Not Ekleyin'
    ),
    ),
    ElevatedButton(
    onPressed: () {
    // Validate returns true if the form is valid, otherwise false.

    },
    child: Text('Tamamla'),
    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'My app', // used by the OS task switcher
    home: SafeArea(
      child: MyScaffold(),
    ),
  ));
}