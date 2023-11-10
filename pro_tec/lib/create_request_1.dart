// import 'package:flutter/material.dart';
//
// class CreateRequest extends StatefulWidget {
//   const CreateRequest({Key? key}) : super(key: key);
//
//   @override
//   _CreateRequestState createState() => _CreateRequestState();
// }
//
// class _CreateRequestState extends State<CreateRequest> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child : Scaffold(
//         appBar: AppBar(
//           title: Text("Create a request",style: TextStyle(color: Colors.black),),
//           elevation: 0,
//           backgroundColor: Colors.white.withOpacity(0),
//         ),
//         body: Stack(
//           children: [
//             Positioned(
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: Image(
//                 image: AssetImage("images/back2.png"),
//                 fit: BoxFit.fill,
//                 width: MediaQuery.of(context).size.width / 1.25,
//                 height: MediaQuery.of(context).size.height /4,
//               ),
//             ),
//             Positioned(
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: Image(
//                 image: AssetImage("images/back1.png"),
//                 fit: BoxFit.fill,
//                 width: MediaQuery.of(context).size.width / 1.5,
//                 height: MediaQuery.of(context).size.height / 4.75,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 //crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//
//                   ElevatedButton(onPressed: (){
//
//                   },
//                       style: ButtonStyle(
//                         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                             RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12.0),
//                             )
//                         ),
//                         backgroundColor: MaterialStateProperty.all(Color(0xFFFB4B4B)),
//                       ),
//                       child: SizedBox(
//                           height: MediaQuery.of(context).size.height/16,
//                           width: MediaQuery.of(context).size.width/1.2,
//                           child: Center(child: Text("Create Request",style: TextStyle(color: Colors.white),))
//                       )),
//
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
