import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}

enum Animals {
  Cat, Dog, Bird, Fish, Lizzard
}

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  Animals _selected = Animals.Cat;
  String _value = 'Make a selection';
  List<PopupMenuEntry<Animals>> _items = List<PopupMenuEntry<Animals>>();

  @override
  void initState() {
    for(var animal in Animals.values) {
      _items.add(PopupMenuItem(
        child: Text(_getDisplay(animal)),
        value: animal
      ));
    }
  }

  void _onSelected(Animals animal) {
    setState(() {
      _selected = animal;
      _value = 'You selected an ${_getDisplay(animal)}';
    });
  }

  String _getDisplay(Animals animal) {
    var index = animal.toString().indexOf('.');
    index++;
    return animal.toString().substring(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(38),
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                child: Text(_value),
              ),
              SizedBox(
                height: 10,
              ),
              PopupMenuButton<Animals>(
                child: Icon(Icons.input),
                initialValue: Animals.Cat,
                onSelected: _onSelected,
                itemBuilder: (context) {
                  return _items;
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}