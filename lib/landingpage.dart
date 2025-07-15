import 'package:expensetracker/balancecard.dart';
import 'package:expensetracker/month.dart';
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
      body: Column(
        children: [
          // month and button 
          Container(
            height: 50,
            color: Colors.amber,
          ),

          Month(),

          SizedBox(height: 25),
          
          // balance card
          BalanceCard(),

          SizedBox(height: 25),


          // transactions list
          Expanded(
            child: Container(
              color: Colors.blue,
              child: Center(
                child: Text("wewew"),
              )
            )
          ),

          // buttons to add stuff
          Container(
            height: 100
          ),
        ],
      )
    );
  }
}