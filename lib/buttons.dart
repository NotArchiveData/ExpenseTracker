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
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  backgroundColor: Colors.transparent,
                  insetPadding: EdgeInsets.zero, 
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF2b2b2b),
                        border: Border.all(
                          color: Color(0xFF949494),
                        ),
                        borderRadius: BorderRadius.circular(20),
                        
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          SizedBox(height:25),

                          Text(
                            "Add Funds",
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false,
                                applyHeightToLastDescent: false,
                              ),
                          ),

                          SizedBox(height:25),

                          TextField(
                            controller: service,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Items / Service",
                            ),
                          ),
                    
                          SizedBox(height:15),
                    
                          TextField(
                            controller: from,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "From",
                            ),
                          ),

                          SizedBox(height:25),

                          Divider(height: 2, color: Color(0xFF949494)),

                          Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text(
                                    "Close",
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                              ),

                              Container(
                                width: 1,
                                height: 50,
                                color: Color(0xFF949494),
                              ),

                              Expanded(
                                child: TextButton(
                                  onPressed: () {
                                    //hi
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "Enter",
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              ),
                            ],
                          ),
                        ],
                      )
                    ),
                  ),
                );
              },
            );
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