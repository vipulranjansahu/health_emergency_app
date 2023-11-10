import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  String age=' ',gender='  Gender',bloodgroup='  Bloodgroup';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/2.5,
                  child: Image(image: AssetImage("images/details.png"),fit: BoxFit.fill,)),
              Expanded(
                  child: Container(
                    child: Column(

                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20),
                          child: TextField(
                            onChanged: (text)
                            {
                              age=text;
                            },
                            decoration: InputDecoration(
                              fillColor: Color(0xFFFF6A6A),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              hintText: '   Age',
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 25,bottom: 10,left: 20,right: 20),
                          child: Container(
                            height: 50,
                            child: DecoratedBox(

                              decoration: ShapeDecoration(

                                  color: Color(0xFFFF6A6A), shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                // side: BorderSide()
                              )
                              ),

                              child: Padding(
                                padding: const EdgeInsets.only(left: 15,top: 8,bottom: 8,right: 15),
                                child: DropdownButton<String>(

                                  isExpanded: true,
                                  focusColor:Colors.white,
                                  // value: _chosenValue,
                                  //elevation: 5,
                                  style: TextStyle(color: Colors.white),
                                  iconEnabledColor:Colors.white,
                                  items: <String>[
                                    '  Gender',
                                    '  Male',
                                    '  Female',
                                    '  Others',

                                  ].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value,style:TextStyle(color:Colors.black),),
                                    );
                                  }).toList(),
                                  hint:Text(
                                    '$gender',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),

                                  onChanged: (String? value) {
                                    setState(() {
                                      gender = value!;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25,bottom: 10,left: 20,right: 20),
                          child: Container(
                            height: 50,
                            child: DecoratedBox(

                              decoration: ShapeDecoration(

                                  color: Color(0xFFFF6A6A), shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                // side: BorderSide()
                              )
                              ),

                              child: Padding(
                                padding: const EdgeInsets.only(left: 15,top: 8,bottom: 8,right: 15),
                                child: DropdownButton<String>(

                                  isExpanded: true,
                                  focusColor:Colors.white,
                                  // value: _chosenValue,
                                  //elevation: 5,
                                  style: TextStyle(color: Colors.white),
                                  iconEnabledColor:Colors.white,
                                  items: <String>[
                                    '  Blood Group',
                                    '  A+',
                                    '  B+',
                                    '  O+',
                                    '  AB+',
                                    '  A-',
                                    '  B-',
                                    '  O-',
                                    '  AB-'


                                  ].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value,style:TextStyle(color:Colors.black),),
                                    );
                                  }).toList(),
                                  hint:Text(
                                    '$bloodgroup',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:20,
                                    ),
                                  ),

                                  onChanged: (String? value) {
                                    setState(() {
                                      bloodgroup = value!;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),





                        Padding(
                          padding: const EdgeInsets.only(left: 20.0,right: 20,top: 18),
                          child: ElevatedButton(onPressed: (){



                          },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    )
                                ),
                                backgroundColor: MaterialStateProperty.all(Color(0xFFFF2626)),
                              ),
                              child: SizedBox(
                                  height: 60,
                                  width: MediaQuery.of(context).size.width/1.2,
                                  child: Center(child: Text("Sign Up",style: TextStyle(
                                    fontSize: 28,
                                  ),)))),
                        ),


                      ],
                    ),
                  ))

            ],
          ),
        )
    );
  }
}
