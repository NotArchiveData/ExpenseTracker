import 'package:flutter/material.dart';

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
          onPressed: (){},
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
          onPressed: (){},
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