import 'package:expensetracker/balancecard.dart';
import 'package:expensetracker/buttons.dart';
import 'package:expensetracker/month.dart';
import 'package:expensetracker/transactions.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2b2b2b),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
        child: Column(
          children: [
            SizedBox(height: 25),
            
            // month and button 
            Container(
              height: 50,
              color: Color(0xFF2b2b2b),
            ),
            
            Month(),
            
            SizedBox(height: 25),
            
            // balance card
            BalanceCard(),
            
            SizedBox(height: 40),
            
            // transactions list
            Transactions(
              transactionName: "Uber Auto",
              date: "15th July",
              money: "120",
              expenseOrIncome: "expense",
            ),

            SizedBox(height: 10),

            Spacer(),
            
            // buttons to add stuff
            Buttons(),
          ],
        ),
      )
    );
  }
}