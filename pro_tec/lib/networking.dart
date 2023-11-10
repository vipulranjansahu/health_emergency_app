import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String token = "";

Future sign_up(String name, String email, String password) async {
  print(email);
  http.Response response = await http.post(
      Uri.parse('https://clumsy-coders-hint.herokuapp.com/users/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "name": name,
        "email": email,
        "password": password,
      }));

  //print(response.body);
  var data = jsonDecode(response.body);
  token = data["token"];
  print(data);
  print(token);
  return data;
}

Future log_in(String email, String password) async {
  print(email);
  http.Response response = await http.post(
      Uri.parse('https://clumsy-coders-hint.herokuapp.com/users/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "email": email,
        "password": password,
      }));

  print(response.statusCode);
  var data = jsonDecode(response.body);
  //print(data);
  token = data["token"];
  return data;
}

Future create_request(String location, String category, String btype,
    String quantity, String description) async {
  print("Hello");
  http.Response response = await http.post(
      Uri.parse("https://clumsy-coders-hint.herokuapp.com/requests/addRequest"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "location": location,
        "needed": category,
        "bType": btype,
        "quantity": quantity,
        "description": description
      }));
  print(response.body);

  await send_notif(description);
}

Future get_data(String fid) async {
  //print("Hello");
  http.Response response = await http.get(
    Uri.parse("https://clumsy-coders-hint.herokuapp.com/requests/getAll"),
    headers: <String, String>{
      'Authorization': 'Bearer $token',
    },
  );
  print(response.statusCode);
  //print(response.body);

  List<dynamic> data = (json.decode(response.body));

  List<dynamic> blood = [];
  List<dynamic> medicine = [];
  List<dynamic> others = [];
  List<dynamic> funds = [];

  for (var i in data) {
    if (i["needed"] == "Blood")
      blood.add(i);
    else if (i["needed"] == "Medicine")
      medicine.add(i);
    else if(i["needed"]=="Fund Raiser")funds.add(i);
    else
      others.add(i);
  }

  http.Response response2 = await http.patch(
      Uri.parse("https://clumsy-coders-hint.herokuapp.com/users/updateProfile"),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({"fId": fid}));
  print(response2.statusCode);
  // print(blood);
  // print(medicine);
  // print(others);
  List<dynamic> data2 = [];
  data2.add(blood);
  data2.add(medicine);
  data2.add(others);
  data2.add(funds);
  //
  return data2;
}

Future get_my_requests() async {
  //print("Hello");
  http.Response response = await http.get(
    Uri.parse("https://clumsy-coders-hint.herokuapp.com/users/getRequests"),
    headers: <String, String>{
      'Authorization': 'Bearer $token',
    },
  );
  print(response.statusCode);
  //print(response.body);

  List<dynamic> data = (json.decode(response.body));

  List<dynamic> past = [];
  List<dynamic> live = [];

  for (var i in data) {
    if (i["completed"] == true)
      past.add(i);
    else
      live.add(i);
  }

  List<dynamic> data2 = [];
  data2.add(live);
  data2.add(past);
  //
  return data2;
}

Future send_notif(String description) async {
  print("Hello");

  http.Response response =
      await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
          headers: <String, String>{
            "Content-Type": "application/json",
            "Authorization":
                "key=AAAA4YRk6rs:APA91bH2_1kwIM54DH4vE_259PCvtqZgezvYwDR9ir0wx2WvX35Ndu1-9N7r_IdDSXI-fG7wHY0VwH0KRMV2c4EN92OcgjGubtZRMQg_9f6wR57eGpGkV-ixSQFVMptgn7LdIEY8lZRs",
          },
          body: jsonEncode({
            "to": "/topics/message",
            "notification": {
              "title": "Emergency",
              "body": description,
              "mutable_content": true,
              "sound": "Tri-tone"
            },
          }));

  print(response.statusCode);
}

Future send_notif_personal(String description, String fid) async {
  http.Response response =
      await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
          headers: <String, String>{
            "Content-Type": "application/json",
            "Authorization":
                "key=AAAA4YRk6rs:APA91bH2_1kwIM54DH4vE_259PCvtqZgezvYwDR9ir0wx2WvX35Ndu1-9N7r_IdDSXI-fG7wHY0VwH0KRMV2c4EN92OcgjGubtZRMQg_9f6wR57eGpGkV-ixSQFVMptgn7LdIEY8lZRs",
          },
          body: jsonEncode({
            "to": "$fid",
            "notification": {
              "title": "New Message",
              "body": description,
              "mutable_content": true,
              "sound": "Tri-tone"
            },
          }));

  print(response.statusCode);
}

Future start_chat(String id) async {
  print("Hello");
  http.Response response = await http.post(
      Uri.parse("https://clumsy-coders-hint.herokuapp.com/chats/initialize"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "id": id,
      }));
  var temp = json.decode(response.body);
  String chat_id = temp["chat"]["_id"];

  return chat_id;
}

Future get_chat(String id) async {
  print("Hello");
  http.Response response = await http.get(
      Uri.parse("https://clumsy-coders-hint.herokuapp.com/chats/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      });
  var temp = json.decode(response.body);
  List<dynamic> data = temp["chats"];

  return data;
}

Future send_chat(String id, String message) async {
  print("Hello");
  http.Response response = await http.post(
      Uri.parse("https://clumsy-coders-hint.herokuapp.com/chats/sendChat"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({"id": id, "message": message}));

  var temp = json.decode(response.body);
  String chat_id = temp["chat"]["_id"];
  print(temp["fId"]);
  await send_notif_personal(message, temp["fId"]);

  return chat_id;
}

Future get_user_chat() async {
  //print(token);
  http.Response response = await http.get(
      Uri.parse("https://clumsy-coders-hint.herokuapp.com/users/getChats"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      });
  List<dynamic> data = json.decode(response.body);
  return data;
}

Future update_request(String id) async {
  //print(token);
  http.Response response = await http.patch(
      Uri.parse(
          "https://clumsy-coders-hint.herokuapp.com/requests/updateRequest"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({"id": id, "completed": true}));
  List<dynamic> data = json.decode(response.body);
  return data;
}

Future raise_funds(String amount,String description,String link,String name) async {

  print("Hello");
  http.Response response = await http.post(
      Uri.parse("https://clumsy-coders-hint.herokuapp.com/requests/addRequest"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "title" : name,
        "driveLink": link,
        "needed": "Fund Raiser",
        "quantity": amount,
        "description": description
      }));

  print(response.body);

  await send_notif(description);
  // var temp = json.decode(response.body);
  // String chat_id = temp["chat"]["_id"];
  //
  // return chat_id;
}

Future update_fund(String id,int amount) async {
  //print(token);
  http.Response response = await http.patch(
      Uri.parse(
          "https://clumsy-coders-hint.herokuapp.com/requests/updateRequest"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({"id": id, "completedAmount": amount}));
      print(response.body);
}