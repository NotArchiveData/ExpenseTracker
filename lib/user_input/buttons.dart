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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(            
            minimumSize: Size(152, 51),
            backgroundColor: Color(0xFF7E8987)
          ),

          onPressed: () {
            showAddFundsDialog(context);
          },

          child: Text(
            "+",
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
            textHeightBehavior: TextHeightBehavior(
                applyHeightToFirstAscent: false,
                // applyHeightToLastDescent: false,
              ),
          ),
        ),

        SizedBox(width:30),
        
        ElevatedButton(
          style: ElevatedButton.styleFrom(            
            minimumSize: Size(152, 51),
            backgroundColor: Color(0xFF7E8987)
          ),
          onPressed: (){
            showSubtractFundsDialog(context);
          },
          child: Text(
            "-",
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
            textHeightBehavior: TextHeightBehavior(
                applyHeightToFirstAscent: false,
                // applyHeightToLastDescent: false,
              ),
          ),
        ),
      ],
    );
  }
}