import 'package:flutter/material.dart';


class updated extends StatefulWidget {
  const updated({super.key});

  @override
  State<updated> createState() => _updatedState();
}

class _updatedState extends State<updated> {

  String level='M';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfffa5951),
        leading: BackButton(
          onPressed: ()=>Navigator.pop(context,false),
        ),
        title:  Text("Edit Profile",style: Theme.of(context).textTheme.headline4),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(35),
          child: Column(
            children: [
              Stack(
                children:[
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset('assets/images/meet.JPG')
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.yellow),
                      child:  IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.add_a_photo,size: 20),color: Colors.black87)
                    ),
                  )
                ]
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50),
                    Text('Name',style: TextStyle(fontSize: 20)),
                    TextField(
                      decoration: InputDecoration(border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )),
                    ),
                    SizedBox(height: 20),
                    Text('Email',style: TextStyle(fontSize: 20)),
                    TextField(
                      decoration: InputDecoration(border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )),
                    ),
                    SizedBox(height: 20),
                    Text('Phone',style: TextStyle(fontSize: 20)),
                    TextField(
                      decoration: InputDecoration(border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )),
                    ),
                    SizedBox(height: 20),
                    Form(
                      child: Column(
                        children: [
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
                        ],
                      )
                    )
                  ],
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}