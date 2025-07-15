import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: Container(
        height: 93,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 8.0,
              offset: Offset(0, 0),
              color: Colors.white,
            )
          ]
        ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
        
                Text(
                  "₹12,209",
                  style: TextStyle(color: Color(0xFF2b2b2b), fontSize: 30, fontWeight: FontWeight.w800),
                  textHeightBehavior: TextHeightBehavior(
                    applyHeightToFirstAscent: false,
                    applyHeightToLastDescent: false,
                  ),
                ),

                
        
                Text("balance remaining", style: TextStyle(color: Color(0xFF949494), fontSize: 12, fontWeight: FontWeight.w600),)
              ],
            ),
          ),
        ),
      );
  }
}