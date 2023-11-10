import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pro_tec/fund_raising.dart';
import 'package:pro_tec/screens/create_request.dart';

class NewEvent extends StatefulWidget {
  const NewEvent({Key? key}) : super(key: key);

  @override
  _NewEventState createState() => _NewEventState();
}

class _NewEventState extends State<NewEvent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "What do you wanna do ?",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(0),
        ),
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image(
                image: AssetImage("images/back2.png"),
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width / 1.25,
                height: MediaQuery.of(context).size.height / 4,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image(
                image: AssetImage("images/back1.png"),
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.height / 4.75,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Image(
                image: AssetImage("images/pic.png"),
                //fit: BoxFit.fill,
                // width: MediaQuery.of(context).size.width / 1.5,
                // height: MediaQuery.of(context).size.height / 4.75,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateRequest()));
                    },
                    child: Container(
                      // height: MediaQuery.of(context).size.height / 3,
                      // width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFFFBEAEA),
                        border: Border.all(color: Color(0xFFFF5E5E))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 30),
                        child: Row(
                          children: [
                            Image(image: AssetImage("images/blood.png")),
                            SizedBox(width: 20,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Create a Request",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color:  Color(0xFFB32525)),),
                                SizedBox(height: 10,),
                                Container(
                                  width: MediaQuery.of(context).size.width/1.75,
                                  child: Text(
                                    "You can create request if you need blood,medicines etc. urgently",
                                    style: TextStyle(color: Color(0xFFFF5E5E)),

                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),

                    ),
                  ),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>FundRaising()));
                    },
                    child: Container(
                      // height: MediaQuery.of(context).size.height / 3,
                      // width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFFFBEAEA),
                          border: Border.all(color: Color(0xFFFF5E5E))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 30),
                        child: Row(
                          children: [
                            Image(image: AssetImage("images/money.png")),
                            SizedBox(width: 20,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Fund Raising",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color:  Color(0xFFB32525)),),
                                SizedBox(height: 10,),
                                Container(
                                  width: MediaQuery.of(context).size.width/1.75,
                                  child: Text(
                                    "You can raise funds for the people in need",
                                    style: TextStyle(color: Color(0xFFFF5E5E)),

                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),

                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
