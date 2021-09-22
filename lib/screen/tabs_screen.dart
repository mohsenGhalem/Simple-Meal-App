import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import '../screen/categories_screen.dart';
import '../screen/favorites_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal>  favoritesMeals;


  TabsScreen(this.favoritesMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();

}



class _TabsScreenState extends State<TabsScreen> {
    int _selectedPageIndex=0;
    void _selectPage(int value) {

      setState(() {
        _selectedPageIndex =value;
      });
  }

  late List<Map<String, Widget>> _pages;
    final List<Map<String, String>> _pagesNames = const [
      {'pageNames':'Categories'},
      {'pageNames':'Favorites'},
    ];
    @override
    void initState() {
      _pages= [
        {'pages':const CategoriesScreen()},
        {'pages':FavoritesScreen(widget.favoritesMeals),}
      ];

    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text(_pagesNames[_selectedPageIndex]['pageNames'].toString()),),
      body: _pages[_selectedPageIndex]['pages'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: false,
        enableFeedback: true,

        iconSize: 25,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.category),label:  'Categories',),
        BottomNavigationBarItem(icon: Icon(Icons.star,),label: 'Favorites'),


        ],),
        drawer: MainDrawer(),
        
    );
  }

  
}