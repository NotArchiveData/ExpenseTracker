import 'package:expensetracker/gsheets_api.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
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
                "₹${NumberFormat('#,##0', 'en_IN').format((GoogleSheetsApi.calculateFunds() - GoogleSheetsApi.calculateExpenses()).toInt())}",
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
      );
  }
}