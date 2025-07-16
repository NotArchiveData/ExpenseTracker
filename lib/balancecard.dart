import 'package:expensetracker/gsheets_api.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
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

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(80, 0, 8, 0),
                      height: 1,
                      color: Color(0xFFBDBDBD),
                    ),
                  ),

                  Text(
                    "balance",
                    style: TextStyle(
                      color: Color(0xFF949494),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(8, 0, 80, 0),
                      height: 1,
                      color: Color(0xFFBDBDBD),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }
}