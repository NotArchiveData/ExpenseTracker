import 'package:expensetracker/colours.dart';
import 'package:expensetracker/user_input/add_funds.dart';
import 'package:expensetracker/user_input/subtract_funds.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(  
            // fixedSize: Size(0, 112),
            fixedSize: Size(0, 65),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: white
          ),

          onPressed: () {
            HapticFeedback.lightImpact();
            showAddFundsDialog(context);
          },

          child: SizedBox.shrink(),
        ),

        ElevatedButton(
          style: ElevatedButton.styleFrom(  
            fixedSize: Size(0, 160),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: white
          ),

          onPressed: (){
            HapticFeedback.lightImpact();
            showSubtractFundsDialog(context);
          },

          child: SizedBox.shrink(),
        ),
      ],
    );
  }
}