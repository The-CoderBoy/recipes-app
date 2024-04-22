// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';

class RecipesGridView extends StatelessWidget {
  // Require a list of recipes to display in a grid
  final List<SimpleRecipe> recipes;

  const RecipesGridView({
    super.key,
    required this.recipes,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      // Displays only the items visible onscreen
      child: GridView.builder(
        itemCount: recipes.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 500),
        itemBuilder: (context, index) {
          final SimpleRecipe = recipes[index];
          return RecipeThumbnail(recipe: SimpleRecipe);
        },
      ),
    );
  }
}
