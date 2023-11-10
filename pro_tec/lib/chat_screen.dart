import 'package:flutter/material.dart';
import 'package:pro_tec/networking.dart';
import 'package:pro_tec/personal_chat.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<dynamic> data = [];

  Future sol() async {
    await log_in("sam@gmail.com", "1234567");
    data = await get_user_chat();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("images/img2.jpg"),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Chat Room",
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(0),
        ),
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFFE8383),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PersonalChat(
                                        id: data[index]["chatId"],
                                        user_id: data[index]["toId"])));
                          },
                          leading: CircleAvatar(
                            backgroundImage: AssetImage("images/img2.jpg"),
                          ),
                          title: Text(data[index]["name"]),
                        ),
                      ),
                    ),
                  );
                },
              );
            }

            print(snapshot.connectionState);
            return Center(
              child: CircularProgressIndicator(),
            );
          },
          future: sol(),
        ),
      ),
    );
  }
}
