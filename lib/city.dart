import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class City extends StatelessWidget {
  final Map<String, dynamic> city;
  const City({Key?key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 180,
      margin: const EdgeInsets.only(right: 17,top: 5),
      decoration: BoxDecoration(
        color: Colors.red[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5,),
                Text("${city['num']}",style: TextStyle(fontSize: 50,fontWeight: FontWeight.w500)),
                Text("${city['city']}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700)),
                Text("${city['price']}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500))
              ],
            ),    
          ),
          SizedBox(height: 4),
          Center(
            child: Text("${city['booked']}"),
          )
        ]
      ),
    );
  }
}