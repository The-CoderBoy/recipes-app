import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../models/grocery_item.dart';

class GroceryTile extends StatelessWidget {
  final GroceryItem? item;

  final Function(bool)? onComplete;

  final TextDecoration? textDecoration;

  GroceryTile({super.key, this.item, this.onComplete})
      : textDecoration = item!.isComplete ?? false
            ? TextDecoration.lineThrough
            : TextDecoration.none;
  @override
  Widget build(BuildContext context) {
// TODO 21: Change this Widget
    return Container(
      height: 100.0,
// TODO 20: Replace this color
      color: Colors.red,
    );
  }

  Widget buildImportance() {
    if (item!.importance == Importance.low) {
      return Text('Low', style: GoogleFonts.lato(decoration: textDecoration));
    } else if (item!.importance == Importance.medium) {
      return Text('Medium',
          style: GoogleFonts.lato(
              fontWeight: FontWeight.w800, decoration: textDecoration));
    } else if (item!.importance == Importance.high) {
      return Text(
        'High',
        style: GoogleFonts.lato(
          color: Colors.red,
          fontWeight: FontWeight.w900,
          decoration: textDecoration,
        ),
      );
    } else {
      throw Exception('This importance type does not exist');
    }
  }

  Widget buildDate() {
    final dateFormatter = DateFormat('MMMM dd h:mm a');
    final dateString = dateFormatter.format(item!.date!);
    return Text(
      dateString,
      style: TextStyle(decoration: textDecoration),
    );
  }

  Widget buildCheckbox() {
    return Checkbox(
      value: item!.isComplete,
      onChanged: (newValue) {
        if (newValue != null) {
          onComplete;
        }
      },
    );
  }
}
