import 'package:flutter/material.dart';
import 'package:pro_tec/networking.dart';
import 'package:pro_tec/widgets/category.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'widgets/my_card.dart';

class MyRequests extends StatefulWidget {
  const MyRequests({Key? key}) : super(key: key);

  @override
  _MyRequestsState createState() => _MyRequestsState();
}

class _MyRequestsState extends State<MyRequests> {
  List<dynamic> data = [];
  void tog() {
    sol();
  }

  Future sol() async {
    await log_in("sam@gmail.com", "1234567");
    data = await get_my_requests();
  }

  int ind = 0;

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
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("images/img2.jpg"),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "My Requests",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: Center(
                      child: ToggleSwitch(
                        minWidth: MediaQuery.of(context).size.width / 3.25,
                        minHeight: MediaQuery.of(context).size.height / 17,
                        cornerRadius: 20.0,
                        activeBgColor: [Colors.white],
                        activeFgColor: Color(0xFFB32525),
                        inactiveBgColor: Color(0xFFB52626),
                        inactiveFgColor: Colors.grey,
                        initialLabelIndex: ind,
                        totalSwitches: 2,
                        labels: ['Live Requests', 'Past Requests'],
                        radiusStyle: true,
                        onToggle: (index) {
                          setState(() {
                            ind = index!;
                          });

                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: FutureBuilder(
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return ListView.builder(
                                itemCount: data[ind].length,
                                itemBuilder: (context, int index) {
                                  return MyCard(data: data[ind][index],show: 0,);
                                });
                          }

                          print(snapshot.connectionState);
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        future: sol(),
                      ),
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
