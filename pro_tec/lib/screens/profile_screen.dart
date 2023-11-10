import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFFFB4B4B),
          child: FaIcon(FontAwesomeIcons.edit),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ), onPressed: () {  },
        ),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.width/8),
                      decoration: BoxDecoration(
                          color: Color(0xFFFB4B4B),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30))),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 6,
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height/11,

                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width/8,
                        backgroundImage: AssetImage("images/img2.jpg"),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text("Sarthak Manocha",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)

                  ),
                ),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                  child: Text("Personal Info",style: TextStyle(fontSize: 20),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Column(
                    children: [
                      ListTile(
                        leading:FaIcon(FontAwesomeIcons.user,color: Colors.red,),
                        title: Text("Sarthak Manocha"),
                      ),
                      ListTile(
                        leading:FaIcon(FontAwesomeIcons.envelope,color: Colors.red,),
                        title: Text("sarthak@gmail.com"),
                      ), ListTile(
                        leading:FaIcon(FontAwesomeIcons.phone,color: Colors.red,),
                        title: Text("+91-7437282347"),
                      ), ListTile(
                        leading:Icon(Icons.male,color: Colors.red,size: 35,),
                        title: Text("Male"),
                      ),
                      ListTile(
                        leading:Icon(Icons.calendar_today_outlined,color: Colors.red,size: 35,),
                        title: Text("Age"),
                      ),

                      ListTile(
                        leading:Icon(Icons.water_drop,color: Colors.red,size: 35,),
                        title: Text("A+ ve"),
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //     children: [
                //       FaIcon(FontAwesomeIcons.user,color: Colors.blue,),
                //       Text("Samarth Goel"),
                //     ],
                //   ),
                // )

              ],
            ),
          ],
        )


      ),
    );
  }
}
