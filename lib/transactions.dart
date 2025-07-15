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
    return Container(
      height: 58,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xFF949494),
        ),
        color: Color(0xFF2b2b2b),
      ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey[500]),
                    child: Center(
                      child: Icon(
                        Icons.attach_money_outlined,
                        color: Colors.white,
                      ),
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
                          color: Color(0xFFFFFFFF),
                          fontSize: 10,
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

    );
    
  }
}