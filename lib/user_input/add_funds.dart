import 'package:expensetracker/gsheets_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// stuff to get access to inputs
final TextEditingController amount = TextEditingController();
final TextEditingController from = TextEditingController();

// enter new transaction into gsheets
void enterTransaction() {
  GoogleSheetsApi.insertFund(
    amount.text,
    from.text,
    "-",
    true,
  );

  // clear text field
    amount.clear();
    from.clear();
}

Future<void> showAddFundsDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF2b2b2b),
              border: Border.all(color: Color(0xFF6BBF59)),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),

                Text(
                  "Add Funds",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  textHeightBehavior: TextHeightBehavior(
                    applyHeightToFirstAscent: false,
                    applyHeightToLastDescent: false,
                  ),
                ),

                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      TextField(
                        controller: amount,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF555555)),
                            borderRadius: BorderRadius.circular(12),  
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),

                          hintText: "Amount",
                          hintStyle: TextStyle(color: Color(0xFF7B7A7C)),
                        ),
                      ),

                      SizedBox(height: 15),

                      TextField(
                        controller: from,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF555555)),
                            borderRadius: BorderRadius.circular(12),  
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),

                          hintText: "From",
                          hintStyle: TextStyle(color: Color(0xFF7B7A7C)),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 25),

                Divider(height: 2, color: Color(0xFF555555)),

                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();

                          amount.clear();
                          from.clear();
                        },

                        child: Text(
                          "Close",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),

                    Container(width: 1, height: 50, color: Color(0xFF555555)),
                    
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          enterTransaction();
                        },
                        child: Text(
                          "Enter",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
