import 'dart:async';

import 'package:expensetracker/balancecard.dart';
import 'package:expensetracker/buttons.dart';
import 'package:expensetracker/loading.dart';
import 'package:expensetracker/month.dart';
import 'package:expensetracker/transactions.dart';
import 'package:flutter/material.dart';

// gsheets
import 'package:gsheets/gsheets.dart';
import 'package:expensetracker/gsheets_api.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  // wait for data to be fetched from gsheets
  bool timerHasStarted = false;
  void startLoading() {
    timerHasStarted = true;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (GoogleSheetsApi.loading == false) {
        setState(() {});
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // start loading until the data comes
    if (GoogleSheetsApi.loading == true && timerHasStarted == false) {
      startLoading();
    }

    // main landing page
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
            
            Month(
              month: "July",
              year: "2025"
            ),
            
            SizedBox(height: 25),
            
            // balance card
            BalanceCard(),
            
            SizedBox(height: 60),

            Text(
              "Transactions",
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
              textHeightBehavior: TextHeightBehavior(
                  applyHeightToFirstAscent: false,
                  applyHeightToLastDescent: false,
                ),
            ),

            SizedBox(height: 18),
              
            // transactions list
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GoogleSheetsApi.loading == true ? LoadingCircle() : ListView.builder(
                  itemCount: GoogleSheetsApi.currentTransactions.length,
                  itemBuilder: (context, index) {
                  return Transactions(
                    date: GoogleSheetsApi.currentTransactions[index][0], 
                    transactionName: GoogleSheetsApi.currentTransactions[index][1], 
                    money: GoogleSheetsApi.currentTransactions[index][2], 
                    expenseOrIncome: GoogleSheetsApi.currentTransactions[index][3]
                  );
                }),
              )
            ),

            SizedBox(height: 10),
            
            // buttons to add stuff
            Buttons(),
          ],
        ),
      )
    );
  }
}