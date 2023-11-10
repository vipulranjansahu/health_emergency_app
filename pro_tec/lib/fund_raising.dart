import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_tec/networking.dart';

class FundRaising extends StatefulWidget {
  const FundRaising({Key? key}) : super(key: key);

  @override
  State<FundRaising> createState() => _FundRaisingState();
}

class _FundRaisingState extends State<FundRaising> {

  String description = "";
  String name = "";
  String amount = "";
  String link = "";
  String acc = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.only(
            top: 25,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(CircleBorder()),
                      backgroundColor: MaterialStateProperty.all(
                          Color(0xFFFF5E5E)), // <-- Button color
                    ),
                  ),
                  Text(
                    "Fund Raising",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFFF6A6A)),
                  child: TextFormField(
                    onChanged: (value) {
                      name = value;
                    },
                    initialValue: " Name of the Campaign",
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFFF6A6A)),
                  child: TextFormField(
                    onChanged: (value) {
                      amount = value;
                    },
                    initialValue: "  How much money you want to raise",
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Container(
                  height: MediaQuery.of(context).size.height / 4.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFFF6A6A)),
                  child: TextFormField(
                    onChanged: (value) {
                      description = value;
                    },
                    initialValue: "  Description",
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFFF6A6A)),
                  child: TextFormField(
                    onChanged: (value) {
                      link= value;
                    },
                    initialValue: "  Drive Link to support documents",
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFFF6A6A)),
                  child: TextFormField(
                    onChanged: (value) {
                      acc= value;
                    },
                    initialValue: "  Account Number",
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: ElevatedButton(
                  onPressed: () async{

                    await raise_funds(amount,description,link,name);

                  },
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Center(
                            child: Text(
                              "Raise Funds",
                              style: TextStyle(fontSize: 20),
                            )),
                      )),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                    backgroundColor: MaterialStateProperty.all(Color(0xFFFB4B4B)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
