import 'package:flutter/material.dart';
import 'selectshite.dart';

class buslist extends StatefulWidget {
  const buslist({super.key, required this.From, required this.To});

  final String From;
  final String To;

  @override
  State<buslist> createState() => _buslistState();
}

class _buslistState extends State<buslist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFeeedf2),
      appBar: AppBar(
        leading: BackButton(
          onPressed: ()=>Navigator.pop(context,false),
        ),
        title:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Row(
              children: [Text(widget.From),Text(' to')],
            ),
            Text(widget.To)
          ]
        )
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                list(
                  Text1: "20:00 - 6:00",
                  Text2: "₹750",
                  Text3: "10h 00m . 15 Seats left . 5Single",
                  Text4: "Shreeji Travels",
                  Text5: "A/C Sleeper (2+1)",
                  Text6: '4.5',
                ),
                SizedBox(height: 20),
                list(
                  Text1: "20:00 - 7:00",
                  Text2: "₹799",
                  Text3: "11h 00m . 03 Seats left . 5Single",
                  Text4: "Pramukh Travels",
                  Text5: "A/C Sleeper (2+1)",
                  Text6: '4.3',
                ),
                SizedBox(height: 20),
                list(
                  Text1: "21:30 - 7:00",
                  Text2: "₹500",
                  Text3: "10h 00m . 15 Seats left . 5Single",
                  Text4: "Shreeji Travels",
                  Text5: "NON A/C Sleeper (2+1)",
                  Text6: '4.0',
                ),
                SizedBox(height: 20),
                list(
                  Text1: "20:30 - 7:30",
                  Text2: "₹550",
                  Text3: "10h 00m . 15 Seats left . 5Single",
                  Text4: "Pramukh Travels",
                  Text5: "NON A/C Sleeper (2+1)",
                  Text6: '3.9',
                ),                
              ],
            ),
          )
        ],
      ),
    );
  }
}

class list extends StatelessWidget {
  const list({Key? key,
  required this.Text1,
  required this.Text2,
  required this.Text3,
  required this.Text4,
  required this.Text5,
  required this.Text6,
  }) : super(key: key);

  final String Text1;
  final String Text2;
  final String Text3;
  final String Text4;
  final String Text5;
  final String Text6;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>BusBookingPage()));},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(Text1,style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.w800)),
                Text(Text2,style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold)),
              ],
            ),
            Text(Text3,style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w500)),
            SizedBox(height: 15),
            Text(Text4,style: TextStyle(fontSize: 28,color: Colors.black,fontWeight: FontWeight.w800)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(Text5,style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500)),
                Container(
                  decoration:  BoxDecoration (
                    borderRadius:  BorderRadius.circular(20),
                    border:  Border.all(color: Color.fromARGB(255, 7, 74, 45)),
                    color:  Colors.white,
                  ),
                  width: 80,
                  height: 30,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                        width: 50,
                        height: 30,
                        decoration:  BoxDecoration (
                          borderRadius:  BorderRadius.circular(20),
                          color:  Color.fromARGB(255, 7, 74, 45),
                        ),
                        child: Row(
                          children: [
                            Text(Text6,style:  TextStyle (fontSize:  12,fontWeight:  FontWeight.w600,color:  Colors.white)),
                            Icon(Icons.star,color: Colors.white,size: 12,)
                          ],
                        )
                      ),
                      Container(
                        width: 25,
                        height: 30,
                      )
                    ],
                  ) 
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}