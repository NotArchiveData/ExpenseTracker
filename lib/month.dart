import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
                color: Color(0xFF949494),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                ),
            ),
          
            Text(
              getMonthYear(),
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 22,
                fontWeight: FontWeight.w600,
                ),
              textHeightBehavior: TextHeightBehavior(
                  applyHeightToFirstAscent: false,
                  applyHeightToLastDescent: false,
                ),
            )
          ],
        ),
    
        // place icon here
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.grey[500]),
          child: Center(
            child: Icon(
              Icons.attach_money_outlined,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}