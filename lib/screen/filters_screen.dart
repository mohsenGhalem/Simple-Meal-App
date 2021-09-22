import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FiltersScreen> {
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;

  @override
  void initState() {
    isGlutenFree = widget.currentFilters['gluten']!;
     isLactoseFree = widget.currentFilters['lactose']!;
     isVegan = widget.currentFilters['Vegan']!;
    isVegetarian = widget.currentFilters['Vegetarian']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Your Filters'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final Map<String, bool> selectedFilters = {
                'gluten': isGlutenFree,
                'lactose': isLactoseFree,
                'Vegan': isVegan,
                'Vegetarian': isVegetarian,
              };

              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Adjust your meal Selection',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                value: isGlutenFree,
                title: const Text(
                  'Gluten Free',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Only includes gluten free meals'),
                onChanged: (value) {
                  setState(() {
                    isGlutenFree = value;
                  });
                },
              ),
              SwitchListTile(
                value: isLactoseFree,
                title: const Text(
                  'Lactose Free',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Only includes lactose free meals'),
                onChanged: (newValue) {
                  setState(() {
                    isLactoseFree = newValue;
                  });
                },
              ),
              SwitchListTile(
                value: isVegan,
                title: const Text(
                  'Vegan ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Only includes vegan free meals'),
                onChanged: (newValue) {
                  setState(() {
                    isVegan = newValue;
                  });
                },
              ),
              SwitchListTile(
                value: isVegetarian,
                title: const Text(
                  'Vegetarian ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Only includes vegetarian free meals'),
                onChanged: (newValue) {
                  setState(() {
                    isVegetarian = newValue;
                  });
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
