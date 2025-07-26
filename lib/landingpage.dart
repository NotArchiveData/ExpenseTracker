import 'dart:async';
import 'package:expensetracker/balance_card.dart';
import 'package:expensetracker/carousel/carousel.dart';
import 'package:expensetracker/carousel/image_cache_preloader.dart';
import 'package:expensetracker/colours.dart';
import 'package:expensetracker/user_input/buttons.dart';
import 'package:expensetracker/month.dart';
import 'package:expensetracker/transactions/transactions.dart';
import 'package:flutter/material.dart';

// gsheets
import 'package:expensetracker/gsheets_api.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  // wait for data to be fetched from gsheets
  bool timerHasStarted = false;
  bool imagesPreloaded = false;

  @override
  void initState() {
    super.initState();

    // Start loading GSheets
    if (GoogleSheetsApi.loading) {
      startLoading();
    }

    // Preload images and trigger rebuild when done
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ImageCacheController().preloadImages(context);
      setState(() {
        imagesPreloaded = true;
      });
    });
  }

  void startLoading() {
    timerHasStarted = true;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (GoogleSheetsApi.loading == false) {
        setState(() {});
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {

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
                color: Colors.white,
                backgroundColor: mainBg,
                onRefresh: () async {
                  await GoogleSheetsApi.loadTransactions();
                  setState(() {});
                },

                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GoogleSheetsApi.loading == true ? const Center(
                    child: CircularProgressIndicator(),
                  ) : ListView.builder(
                    itemCount: GoogleSheetsApi.currentTransactions.length,
                    itemBuilder: (context, index) {
                      final reversedList = GoogleSheetsApi.currentTransactions.reversed.toList();

                      return Transactions(
                        date: reversedList[index][0], 
                        time: reversedList[index][1], 
                        transactionName: reversedList[index][2], 
                        items: reversedList[index][3], 
                        money: reversedList[index][4], 
                        expenseOrIncome: reversedList[index][5],
                        onDelete: () {
                          setState(() {}); // Rebuild the list here
                        },
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
                SizedBox(
                  height: 250,
                  width: 230,
                  child: imagesPreloaded ? MyCarousel() : const Center(child: CircularProgressIndicator(),),
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