import 'package:expensetracker/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

// get month
String getMonthYear() {
  DateTime now = DateTime.now();
  return DateFormat('MMMM yyyy').format(now);
}

class Month extends StatelessWidget {
  const Month({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Expenses",
              style: TextStyle(
                color: mediumGrey,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                ),
            ),
          
            Text(
              getMonthYear(),
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 18,
                fontWeight: FontWeight.w600,
                ),
              textHeightBehavior: TextHeightBehavior(
                  applyHeightToFirstAscent: false,
                  applyHeightToLastDescent: false,
                ),
            )
          ],
        ),
    
        // icon to go to spreadsheets
        Material(
          color: fadedGrey,
          shape: const CircleBorder(),
          child: InkWell(
            onTap: () {
              HapticFeedback.lightImpact();
              launchUrl(Uri.parse("https://docs.google.com/spreadsheets/d/1Ivzee5um4xcC7wAEit45GNNEmOJsOQLdGVweXBZW2Jk/edit"));
            },
            customBorder: const CircleBorder(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.exit_to_app, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}