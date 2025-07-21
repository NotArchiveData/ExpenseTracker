import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        insetPadding: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Color(0xFF555555)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),

              child: IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.min, 
                  children: [
                          
                    // GREY MAIN CONTAINER
                    Flexible( 
                      child: Container(
                        color: Color(0xFF2b2b2b),
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                          
                    // RED SIDE CONTAINER
                    GestureDetector(
                      onTap: () {                        
                        HapticFeedback.mediumImpact();
                        Navigator.of(context).pop();
                      },                      
                      child: Container(
                        width: 50,
                        color: Color(0xFFDB5375),
                        child: Center(
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 20,
                          ),
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}