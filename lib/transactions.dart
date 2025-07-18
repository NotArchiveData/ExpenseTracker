import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Transactions extends StatefulWidget {
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
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        // main rectangle
        ClipRRect(
          borderRadius: BorderRadius.circular(15),

          child: Slidable(
            startActionPane: ActionPane(
              motion: StretchMotion(), 
              children: [
                SlidableAction(
                  onPressed: ((context) {
                    HapticFeedback.mediumImpact();
                  }),
                  icon: Icons.edit,
                ),
              ],
            ),

            endActionPane: ActionPane(
              motion: StretchMotion(), 
              children: [
                SlidableAction(
                  onPressed: ((context) {
                    HapticFeedback.mediumImpact();
                  }),
                  icon: Icons.delete,
                  backgroundColor: Colors.red,
                ),
              ],
            ),
          
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: isExpanded ? 130 : 70,
                decoration: BoxDecoration(
                  color: Color(0xFF3C3C3C),
                ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
              
                            // thin rectangle design
                            AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              width: 8,
                              height: isExpanded ? 90 : 40,
                              decoration: BoxDecoration(
                                  color: widget.expenseOrIncome == 'expense' ? Color(0xFFDB5375) : Color(0xFF6BBF59),
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
                                  widget.transactionName,
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
                                  widget.date,
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
                          (widget.expenseOrIncome == 'expense' ? '-' : '+') + '₹' + widget.money,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color:
                                widget.expenseOrIncome == 'expense' ? Color(0xFFDB5375) : Color(0xFF6BBF59),
                          )
                        )
                      ],  
                    ),
                  )
              ),
            ),
          ),
        ),

        SizedBox(height:10),
      ],
    );
  }
}