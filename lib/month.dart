import 'package:flutter/material.dart';

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
                fontWeight: FontWeight.w600,
                ),
            ),
          
            Text(
              "July 2025",
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
        Text(" "),
      ],
    );
  }
}