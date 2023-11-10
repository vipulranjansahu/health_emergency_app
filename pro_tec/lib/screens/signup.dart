import 'package:flutter/material.dart';
import 'package:pro_tec/main.dart';
import 'package:pro_tec/screens/signin.dart';
import 'package:pro_tec/networking.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String name=' ',email=' ',password=' ';
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
                  child: Image(image: AssetImage("images/signup.png"),fit: BoxFit.fill,)),
              Expanded(
                  child: Container(
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
                          hintText: '   Full Name',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,right: 20,top: 10),
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
                      padding: const EdgeInsets.only(left: 20.0,right: 20,top: 10),
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
                          hintText: '   Password',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,right: 20,top: 10),
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
                          hintText: '   Confirm Password',
                        ),
                      ),
                    ),



                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,right: 20,top: 18),
                      child: ElevatedButton(onPressed: ()async{

                          await sign_up(name, email, password);
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
                              height: 50,
                              width: MediaQuery.of(context).size.width/1.2,
                              child: Center(child: Text("Sign Up",style: TextStyle(
                                fontSize: 28,
                              ),)))),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?"),
                        TextButton(onPressed: (){

                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));

                        }, child: Text(" Sign In",style: TextStyle(color:Color(0xFFFC6464) ),)),
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
