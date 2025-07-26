import 'package:expensetracker/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: mainBg,
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

                    Divider(height: 2, color: fadedGrey),

                    // cancel button
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          HapticFeedback.lightImpact();
                          Navigator.of(context).pop();
                        },
                        splashColor: Colors.white12,
                        highlightColor: Colors.white10,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(14.0),
                          alignment: Alignment.center,
                          child: const Text(
                            "Cancel",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Divider(height: 2, color: fadedGrey),

                    // delete button
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          HapticFeedback.lightImpact();
                          Navigator.of(context).pop();
                          onConfirm();
                        },
                        splashColor: Colors.white12,
                        highlightColor: Colors.white10,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
                          alignment: Alignment.center,
                          child: const Text(
                            "Delete",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
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
        ],
      );
    },
  );
}
