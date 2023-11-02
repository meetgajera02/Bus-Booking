import 'package:flutter/material.dart';
//import 'package:bus/screens/account.dart';

class person extends StatefulWidget {
  const person({Key? key}):super(key: key);

  @override
  _person createState() => _person();
}
class _person extends State<person>{

  //var isDark = MediaQuery.of().platformBrightness == Brightness.dark;
  String level='M';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFeeedf2),
      appBar: AppBar(
        backgroundColor: Color(0xfffa5951),
        leading: BackButton(
          onPressed: ()=>Navigator.pop(context,false),
        ),
        title: const Text("Profile",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
        // actions: [
        //   IconButton(onPressed: (){}, icon: Icon(isDark? Icons.sunny : Icons.money_off))
        // ],
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16,right: 16),
            child: Column(
              children: [
                SizedBox(height: 50),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white
                  ),
                  child: Column(
                    children: [
                       Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("PERSONAL DETAILS",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            InkWell(
                              onTap: (){},
                              child: Text("EDIT",style: TextStyle(fontSize: 20,color: Colors.lightBlue,fontWeight: FontWeight.w500),))
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.person,size: 80),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Name"),
                                  Text("Meet Gajera",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
                                  Text("Age"),
                                  Text("0",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
                                  Text("Gender"),
                                  Row(
                                    children: [
                                      Radio(
                                        value: "Male", 
                                        groupValue: level, 
                                        onChanged: (value) {
                                          setState((){level=value.toString();});
                                        }),
                                      Text("M",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
                                      Radio(
                                        value: "Female", 
                                        groupValue: level, 
                                        onChanged: (value) {
                                          setState((){level=value.toString();});
                                        }
                                      ),
                                      Text("F",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500))
                                    ],
                                  ),
                                  Text("Mobile number"),
                                  Text("+91 9537230057",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
                                  Text("Email"),
                                  Text("meetgajera413@gmail.com ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500))
                              ],
                            ),
                          ],
                        ),
                    ]
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}