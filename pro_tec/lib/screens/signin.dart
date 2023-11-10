import 'package:flutter/material.dart';
import 'package:pro_tec/main.dart';
import 'package:pro_tec/networking.dart';
import 'package:pro_tec/screens/signup.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email=" ",password=" ";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
      body: Column(
children: [
      Image(image: AssetImage("images/login.png")),
       Expanded(child: Container(
         child: Column(

           children: [
  Padding(
    padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20),
    child: TextField(
      onChanged: (text)
      {
        email=text;
      },
      decoration: InputDecoration(
        fillColor: Color(0xFFFF6A6A),
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        hintText: '   Email',
      ),
    ),
  ),
  Padding(
    padding: const EdgeInsets.only(left: 20.0,right: 20,top: 15),
    child: TextField(
      obscureText: true,
      onChanged: (text)
      {
        password=text;
      },
      decoration: InputDecoration(
        fillColor: Color(0xFFFF6A6A),
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        hintText: '   Password',
      ),
    ),
  ),
  Padding(
    padding: const EdgeInsets.only(right: 8),
    child: Align(
        alignment: Alignment.topRight,
        child: TextButton(onPressed: (){}, child: Text("Forgot Password?",style: TextStyle(color: Color(0xFFFC6464)),))),
  ),
             Padding(
               padding: const EdgeInsets.only(left: 20.0,right: 20,),
               child: ElevatedButton(onPressed: ()async{

                  await log_in(email, password);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));

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
                       child: Center(child: Text("Sign In",style: TextStyle(
                         fontSize: 28,
                       ),)))),
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("Not a member?"),
                 TextButton(onPressed: (){

                   Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));

                 }, child: Text("Register Now",style: TextStyle(color:Color(0xFFFC6464) ),)),
               ],
             )

],
         ),
       ))

          ],
        ),
    )
    );
  }
}
