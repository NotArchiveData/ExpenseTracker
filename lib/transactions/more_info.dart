import 'package:expensetracker/colours.dart';
import 'package:flutter/material.dart';

Future<void> showMoreInfo(BuildContext context, {
  required String transactionName,
  required String time,
  required String date,
  required String items,
  required String money,

}) async {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: fadedGrey),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
        
            child: IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.min, 
                children: [
                        
                  // Grey main rect
                  Expanded( 
                    child: Container(
                      color: mainBg,
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        
                          Text(
                            "Details",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        
                          SizedBox(height: 10),
                        
                          Text(
                            transactionName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        
                          SizedBox(height: 2),
                        
                          Text(
                            items,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        
                          SizedBox(height: 2),
                        
                          Text(
                            "$time, $date",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        
                          SizedBox(height: 2),
                        
                          Text(
                            "-₹$money",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                        
                  // Red side rect
                  Container(
                    width: 50,
                    color: expRed,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}