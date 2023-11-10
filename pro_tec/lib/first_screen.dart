import 'package:flutter/material.dart';
import 'package:pro_tec/screens/signin.dart';


class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
      },
      child: Container(
        decoration: BoxDecoration(
          image:DecorationImage(image:AssetImage("images/f.jpeg") )
        ),
      ),
    );
  }
}
