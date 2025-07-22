import 'package:expensetracker/gsheets_api.dart';
import 'package:expensetracker/transactions/confirm_del.dart';
import 'package:expensetracker/transactions/more_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Transactions extends StatefulWidget {
  final String transactionName;
  final String date;
  final String time;
  final String items;
  final String money;
  final String expenseOrIncome;
  final VoidCallback onDelete;

  Transactions({
    required this.transactionName,
    required this.date,
    required this.time,
    required this.items,
    required this.money,
    required this.expenseOrIncome,
    required this.onDelete,
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

          child:  Slidable(

            // extra info
            startActionPane: widget.expenseOrIncome == "expense" ? ActionPane(
              motion: StretchMotion(), 
              children: [
                SlidableAction(
                  onPressed: ((context) {
                    HapticFeedback.mediumImpact();
                    showMoreInfo(
                      context,
                      transactionName: widget.transactionName,
                      time: widget.time,
                      date: widget.date,
                      items: widget.items,
                      money: widget.money,
                      
                    );
                  }),
                  icon: Icons.info_outline,
                  backgroundColor: Color(0xFFEAEAEA),
                ),
              ],
            ) : null,

            // delete
            endActionPane: ActionPane(
              motion: StretchMotion(), 
              children: [
                SlidableAction(
                  onPressed: ((context) {
                    showDeleteConfirmation(
                      context, 
                      transactionPreview: Transactions(
                        transactionName: widget.transactionName,
                        date: widget.date,
                        time: widget.time,
                        items: widget.items,
                        money: widget.money,
                        expenseOrIncome: widget.expenseOrIncome,
                        onDelete: () {},                        
                      ),
                      onConfirm: () {
                    
                        GoogleSheetsApi.deleteRow(
                          widget.transactionName,
                          widget.date, 
                          widget.time
                          );

                        GoogleSheetsApi.currentTransactions.removeWhere((row) =>
                          row[0] == widget.date &&
                          row[1] == widget.time &&
                          row[2] == widget.transactionName
                        );

                        widget.onDelete();

                        HapticFeedback.mediumImpact();
                      }
                    );
                  }),
                  icon: Icons.delete,
                  backgroundColor: Color(0xFFDB5375),
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
              
                            // thin rectangle design on the left
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
                            
                            // main transaction + time and date
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 220),
                                  child: Text(
                                    widget.transactionName,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textHeightBehavior: TextHeightBehavior(
                                        applyHeightToFirstAscent: false,
                                        applyHeightToLastDescent: false,
                                      ),
                                  )
                                ),

                                SizedBox(height:2),
                            
                                Text(
                                  "${widget.time}, ${widget.date}",
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