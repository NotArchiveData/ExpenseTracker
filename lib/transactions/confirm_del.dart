import 'package:flutter/material.dart';

Future<void> showDeleteConfirmation(BuildContext context, {
  required Widget transactionPreview,
  required VoidCallback onConfirm,
}) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          IgnorePointer(
            ignoring: true,
            child: transactionPreview,
          ),

          // SizedBox(height: 20,),
      
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF2B2B2B),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
                SizedBox(height: 20),

                Center(
                  child: Text(
                    "Delete transaction?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                SizedBox(height: 2),

                Center(
                  child: Text(
                    "You can't undo this action.",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                    )
                  ),
                ),
            
                const SizedBox(height: 20),
            
                Column(
                  children: [

                    Divider(height: 2, color: Color(0xFF555555)),

                    Center(
                      child: TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(
                          "Cancel", 
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            )
                          ),
                      ),
                    ),
            
                    Divider(height: 2, color: Color(0xFF555555)),
            
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          onConfirm();
                        },
                        child: Text(
                          "Delete", 
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            )
                          ),
                      ),
                    ),
                  ],
                ),


              ],
            ),
          ),

          

          
        ],
      );
    },
  );
}
