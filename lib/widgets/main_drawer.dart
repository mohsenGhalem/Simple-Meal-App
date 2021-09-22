import 'package:flutter/material.dart';
import 'package:meal_app/screen/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData icon,VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(icon,size: 30,color: Colors.black54,),
      title: Text(
        title,
        style:const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap:tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: DrawerHeader(
              child: const Text(
                'Cooking App',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'RobotoCondensed-Bold',
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                ),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          buildListTile('Meal', Icons.restaurant,(){Navigator.of(context).pushReplacementNamed('/');}),
          buildListTile('Fliters', Icons.settings,(){Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);})
        ],
      ),
    );
  }
}
