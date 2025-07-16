import 'package:expensetracker/user_input/add_funds.dart';
import 'package:expensetracker/user_input/subtract_funds.dart';
import 'package:flutter/material.dart';

// text editing fields to get access to what i typed
TextEditingController service = TextEditingController();
TextEditingController from = TextEditingController();
TextEditingController amount = TextEditingController();

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(  
            fixedSize: Size(0, 112),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Color(0xFFFFFFFF)
          ),

          onPressed: () {
            showAddFundsDialog(context);
          },

          child: Text(
            "➕",
            style: TextStyle(
              color: Color(0xFF6BBF59),
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
            textHeightBehavior: TextHeightBehavior(
                applyHeightToFirstAscent: false,
                // applyHeightToLastDescent: false,
              ),
          ),
        ),

        SizedBox(height:20),
        
        ElevatedButton(
          style: ElevatedButton.styleFrom(  
            fixedSize: Size(0, 112),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Color(0xFFFFFFFF)
          ),

          onPressed: (){
            showSubtractFundsDialog(context);
          },

          child: Text(
            "😭",
            style: TextStyle(
              color: Color(0xFFDB5375),
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
            textHeightBehavior: TextHeightBehavior(
                applyHeightToFirstAscent: false,
              ),
          ),
        ),
      ],
    );
  }
}