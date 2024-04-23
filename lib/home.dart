import 'package:chapter_5/screens/explore_screen.dart';
import 'package:chapter_5/screens/recipes_screen.dart';
import 'package:flutter/material.dart';
import './screens/grocery_screen.dart';
import 'package:provider/provider.dart';
import 'models/models.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    RecipesScreen(),
    const GroceryScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(
      builder: (context, tabManager, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Fooderlich',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: pages[tabManager.selectedTab],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.green,
            currentIndex: tabManager.selectedTab,
            onTap: (index) {
              tabManager.goToTab(index);
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.explore), label: 'Explore'),
              BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Recipes'),
              BottomNavigationBarItem(icon: Icon(Icons.list), label: 'To Buy'),
            ],
          ),
        );
      },
    );
  }
}
