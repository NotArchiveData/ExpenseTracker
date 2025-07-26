import 'package:expensetracker/colours.dart';
import 'package:expensetracker/gsheets_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> showSubtractFundsDialog(BuildContext context) async {

  // stuff to get access to inputs
  final TextEditingController amount = TextEditingController();
  final TextEditingController to = TextEditingController();
  final TextEditingController items = TextEditingController();

  // focus nodes for text fields to go from one to two
  final FocusNode one = FocusNode();
  final FocusNode two = FocusNode();
  final FocusNode three = FocusNode();

  // formatting text fields 
  InputDecoration buildInputDecoration(String hintText) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: fadedGrey),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(12),
      ),
      hintText: hintText,
      hintStyle: TextStyle(color: fadedGrey),
    );
  }

  // things that happen when you tap enter
  void tapEnter() {
    HapticFeedback.lightImpact();

    if (amount.text.trim().isEmpty || to.text.trim().isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill all required fields")));
    } else {
      if (items.text.trim().isEmpty) {
        items.text = "---";
      }

      Navigator.of(context).pop();  

      // enter transaction
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
  }

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
              border: Border.all(color: expRed),
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
                      TextFormField(
                        autofocus: true,
                        focusNode: one,
                        controller: amount,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        style: TextStyle(color: Colors.white),
                        decoration: buildInputDecoration("Amount"),
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(two);
                        },
                      ),

                      SizedBox(height: 15),

                      // input to
                      TextFormField(
                        focusNode: two,
                        controller: to,
                        style: TextStyle(color: Colors.white),
                        decoration: buildInputDecoration("To"),
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(three);
                        },
                      ),

                      SizedBox(height: 15),

                      // input items
                      TextFormField(
                        focusNode: three,
                        controller: items,
                        style: TextStyle(color: Colors.white),
                        decoration: buildInputDecoration("Items / Service"),
                        onFieldSubmitted: (value) {
                          tapEnter();
                        },
                      ),
                    ],
                  ),  
                ),

                SizedBox(height: 25),

                Divider(height: 2, color: fadedGrey),

                Row(
                  children: [

                    // close button
                    Expanded(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            HapticFeedback.lightImpact();
                            Navigator.of(context).pop();
                      
                            amount.clear();
                            to.clear();
                            items.clear();
                          },
                          splashColor: Colors.white12,
                          highlightColor: Colors.white10,
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            alignment: Alignment.center,
                            child: const Text(
                              "Close",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Container(width: 1, height: 57, color: fadedGrey),
                    
                    // enter button
                    Expanded(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            tapEnter();
                          },
                          splashColor: Colors.white12,
                          highlightColor: Colors.white10,
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            alignment: Alignment.center,
                            child: const Text(
                              "Enter",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
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
