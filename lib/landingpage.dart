import 'dart:async';

import 'package:expensetracker/balancecard.dart';
import 'package:expensetracker/user_input/buttons.dart';
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
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          children: [
            
            Container(
              height: 50,
              color: Color(0xFF2b2b2b),
            ),
            
            // month and icon button 
            Month(),
            
            SizedBox(height: 20),
            
            // balance card
            BalanceCard(),
            

            SizedBox(height: 20),
              
            // transactions list
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  await GoogleSheetsApi.loadTransactions();
                  setState(() {});
                },
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GoogleSheetsApi.loading == true ? LoadingCircle() : ListView.builder(
                    reverse: false,
                    itemCount: GoogleSheetsApi.currentTransactions.length,
                    itemBuilder: (context, index) {
                    return Transactions(
                      date: GoogleSheetsApi.currentTransactions[index][0], 
                      transactionName: GoogleSheetsApi.currentTransactions[index][1], 
                      money: GoogleSheetsApi.currentTransactions[index][2], 
                      expenseOrIncome: GoogleSheetsApi.currentTransactions[index][3]
                    );
                  }),
                ),
              )
            ),

            SizedBox(height: 20),
            
            // carousel and buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 250,
                  width: 230,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                SizedBox(
                  height: 250,
                  child: Buttons()
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}