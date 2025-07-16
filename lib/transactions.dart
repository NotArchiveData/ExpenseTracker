import 'package:flutter/material.dart';

class Transactions extends StatelessWidget {
  final String transactionName;
  final String date;
  final String money;
  final String expenseOrIncome;

  Transactions({
    required this.transactionName,
    required this.date,
    required this.money,
    required this.expenseOrIncome
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xFF3C3C3C),
          ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 40,
                        decoration: BoxDecoration(
                            color: expenseOrIncome == 'expense' ? Color(0xFFDB5375) : Color(0xFF6BBF59),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            )
                        ),
                      ),
        
                      SizedBox(width: 15),
                      
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactionName,
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false,
                                applyHeightToLastDescent: false,
                              ),
                          ),
                      
                          Text(
                            date,
                            style: TextStyle(
                              color: Color(0xFF949494),
                              fontSize: 8,
                              fontWeight: FontWeight.w400,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false,
                                applyHeightToLastDescent: false,
                              ),
                          ),
                        ],
                      ),
                    ],
                  ),
        
                  Text(
                    (expenseOrIncome == 'expense' ? '-' : '+') + '₹' + money,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color:
                          expenseOrIncome == 'expense' ? Color(0xFFDB5375) : Color(0xFF6BBF59),
                    )
                  )
                ],  
              ),
            )
        
        ),

        SizedBox(height:10),
      ],
    );
    
  }
}