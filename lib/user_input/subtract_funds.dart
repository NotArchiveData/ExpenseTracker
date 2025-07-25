import 'package:expensetracker/gsheets_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// stuff to get access to inputs
final TextEditingController amount = TextEditingController();
final TextEditingController to = TextEditingController();
final TextEditingController items = TextEditingController();

// enter new transaction into gsheets
void enterTransaction() {
  GoogleSheetsApi.insertFund(
    amount.text,
    to.text,
    items.text,
    false,
  );

  // clear text field
  amount.clear();
  to.clear();
  items.clear();
}

Future<void> showSubtractFundsDialog(BuildContext context) async {
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
              border: Border.all(color: Color(0xFFDB5375)),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),

                // title
                Text(
                  "Expenses",
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

                      // input amount
                      TextField(
                        autofocus: true,
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

                      // input to
                      TextField(
                        controller: to,
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

                          hintText: "To",
                          hintStyle: TextStyle(color: Color(0xFF7B7A7C)),
                        ),
                      ),

                      SizedBox(height: 15),

                      // input items
                      TextField(
                        controller: items,
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

                          hintText: "Items / Service",
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
                          HapticFeedback.lightImpact();
                          Navigator.of(context).pop();

                          amount.clear();
                          to.clear();
                          items.clear();
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
                          HapticFeedback.lightImpact();

                          if (amount.text.trim().isEmpty || to.text.trim().isEmpty) {

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill all required fields")));
                          } else {
                            items.text = "---";
                            enterTransaction();
                            Navigator.of(context).pop();  
                          }
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
