import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({Key?key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  String dropdwonValue = 'Indai';
  String dropdwonValue1 = 'English';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFeeedf2),
      appBar: AppBar(
        backgroundColor: Color(0xfffa5951),
        leading: BackButton(
          onPressed: ()=>Navigator.pop(context,false),
        ),
        title:  Text("Setting",style: TextStyle(fontSize: 26,color:Color.fromARGB(255, 255, 255, 255),fontWeight: FontWeight.w400)),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16,right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Country",style: TextStyle(fontSize: 21,color:Color(0xFF3b3b3b),fontWeight: FontWeight.w600)),
                          DropdownButton<String>(
                            value: dropdwonValue,
                            items: [
                              DropdownMenuItem(value:'Indai',child: Text('Indai')),
                              DropdownMenuItem(value:'US',child: Text('US')),
                              DropdownMenuItem(value:'canada',child: Text('canada')),
                            ],
                            onChanged: (String? newValue){
                              setState(() {
                                dropdwonValue = newValue!;
                              });
                            }
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        margin:  EdgeInsets.fromLTRB(0, 0, 0, 11),
                        width:  double.infinity,
                        height:  1,
                        decoration:  BoxDecoration (
                        color:  Color(0x7f000000),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Currency",style: TextStyle(fontSize: 21,color:Color(0xFF3b3b3b),fontWeight: FontWeight.w600)),
                          Icon(Icons.arrow_forward)
                        ],
                      ),                      
                      SizedBox(height: 10),
                      Container(
                        margin:  EdgeInsets.fromLTRB(0, 0, 0, 11),
                        width:  double.infinity,
                        height:  1,
                        decoration:  BoxDecoration (
                        color:  Color(0x7f000000),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Language",style: TextStyle(fontSize: 21,color:Color(0xFF3b3b3b),fontWeight: FontWeight.w600)),
                          DropdownButton<String>(
                            value: dropdwonValue1,
                            items: [
                              DropdownMenuItem(value:'English',child: Text('English')),
                              DropdownMenuItem(value:'Hindi',child: Text('Hindi')),
                              DropdownMenuItem(value:'Gujrati',child: Text('Gujrati')),
                            ],
                            onChanged: (String? newValue){
                              setState(() {
                                dropdwonValue1 = newValue!;
                              });
                            }
                          )
                        ],
                      ),                    ],
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