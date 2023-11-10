import 'package:flutter/material.dart';
import 'my_card.dart';
import 'my_card2.dart';

class Category extends StatefulWidget {
  Category({required this.name, required this.data});

  String name;
  List<dynamic> data;

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              widget.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: widget.data.length,
              itemBuilder: (BuildContext context,int index){
                return (widget.name=="Fund Raising") ? MyFCard(data: widget.data[index],show: 1,) : MyCard(data: widget.data[index],show: 1,);
              },
              scrollDirection: Axis.horizontal,

            ),
          )
        ],
      ),
    );
  }
}
