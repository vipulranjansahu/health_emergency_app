import 'package:flutter/material.dart';
import 'package:pro_tec/screens/firstAidScreens/bee_sting.dart';
import 'package:pro_tec/screens/firstAidScreens/burns.dart';
import 'package:pro_tec/screens/firstAidScreens/drowning.dart';
import 'package:pro_tec/screens/firstAidScreens/fractures.dart';
import 'package:pro_tec/screens/firstAidScreens/low_bp.dart';
class FirstAid extends StatefulWidget {
  const FirstAid({Key? key}) : super(key: key);

  @override
  State<FirstAid> createState() => _FirstAidState();
}

class _FirstAidState extends State<FirstAid> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image(
                image: AssetImage("images/Vector.png"),
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width / 1.25,
                height: MediaQuery.of(context).size.height / 1.75,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Image(
                image: AssetImage("images/img.png"),
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.height / 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:AssetImage("images/img2.jpg"),
                        ),
                        SizedBox(width: 10,),
                        Text("Hi, Samarth",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),

                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                  //   child: Text("Live Requests ",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),
                  // ),

                  // Expanded(
                  //   child: Container(
                  //     child: ListView(
                  //       children: [
                  //         MyCard(),
                  //         MyCard(),
                  //         MyCard(),
                  //         MyCard(),
                  //       ],
                  //     ),
                  //   ),
                  // )
                  Expanded(
                    child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Burns()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width/1.8,
                              decoration: BoxDecoration(
                                color: Color(0xFFFBEAEA),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image(image: AssetImage("images/burn.png"),

                                  ),
                                  Text("Skin Burns",
                                    style: TextStyle(
                                        color: Color(0xFFB32525,),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20
                                    ),

                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LowBp()));

                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width/1.8,
                              decoration: BoxDecoration(
                                color: Color(0xFFFBEAEA),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image(image: AssetImage("images/lowbp.png"),

                                  ),
                                  Text("Low BP",
                                    style: TextStyle(
                                        color: Color(0xFFB32525,),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20
                                    ),

                                  )
                                ],
                              ),
                            ),
                          ),
                        ), GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Fractures()));

                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width/1.8,
                              decoration: BoxDecoration(
                                color: Color(0xFFFBEAEA),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image(image: AssetImage("images/fracture.png"),

                                  ),
                                  Text("Fractures",
                                    style: TextStyle(
                                        color: Color(0xFFB32525,),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20
                                    ),

                                  )
                                ],
                              ),
                            ),
                          ),
                        ), GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>BeeSting()));

                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width/1.8,
                              decoration: BoxDecoration(
                                color: Color(0xFFFBEAEA),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image(image: AssetImage("images/beesting.png"),

                                  ),
                                  Text("Bee Sting",
                                    style: TextStyle(
                                        color: Color(0xFFB32525,),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20
                                    ),

                                  )
                                ],
                              ),
                            ),
                          ),
                        ), GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Drowning()));

                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width/1.8,
                              decoration: BoxDecoration(
                                color: Color(0xFFFBEAEA),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image(image: AssetImage("images/drowning.png"),

                                  ),
                                  Text("Drowning",
                                    style: TextStyle(
                                        color: Color(0xFFB32525,),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20
                                    ),

                                  )
                                ],
                              ),
                            ),
                          ),
                        ),




                      ],
                    ),
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
