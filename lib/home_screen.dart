import 'buslist.dart';
import 'city.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'app_info_list.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  DateTime time = DateTime.now();
  String from = '';
  String To = '';
  final _fromController = TextEditingController();
  final _ToController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFeeedf2),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16,right: 16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Text("Good Morning",style: TextStyle(fontSize: 18,color:Color(0xFF3b3b3b),fontWeight: FontWeight.w500)),
                  SizedBox(height: 3,),
                  Text("Bus Ticket",style: TextStyle(fontSize: 30,color:Color(0xFF3b3b3b),fontWeight: FontWeight.bold)),
                  SizedBox(height: 40),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _fromController,
                                validator: (text) => text!.isEmpty ? "destination is required" : null,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  prefixIcon: FaIcon(FontAwesomeIcons.bus,size: 40,color: Colors.black87),
                                  hintText: "From",
                                )
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin:  EdgeInsets.fromLTRB(0, 0, 0, 11),
                          width:  double.infinity,
                          height:  1,
                          decoration:  BoxDecoration (
                          color:  Color(0x7f000000),
                          ),
                        ),
                        Container(
                            child: Column(
                            children: [
                            TextFormField(
                              controller: _ToController,
                              validator: (text) => text!.isEmpty ? "destination is required" : null,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  prefixIcon: FaIcon(FontAwesomeIcons.bus,size: 40,color: Colors.black87),
                                  hintText: "To",
                                )
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin:  EdgeInsets.fromLTRB(0, 0, 0, 11),
                          width:  double.infinity,
                          height:  1,
                          decoration:  BoxDecoration (
                          color:  Color(0x7f000000),
                          ),
                        ),
                        Container(
                            child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Icon(Icons.date_range,size: 40),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Text("Date of journey"),
                                Text("${DateFormat('yMMMMd').format(time)}",style: TextStyle(fontSize: 18,color:Color(0xFF3b3b3b),fontWeight: FontWeight.w500),),
                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  minimumSize: Size(00, 45),
                                  textStyle: TextStyle(fontSize: 15),
                                  primary: Colors.red[100],
                                  onPrimary: Colors.black
                                ),
                                onPressed: _showDatePicker,
                                child: Text("Today")
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      minimumSize: Size(400, 50),
                      textStyle: TextStyle(fontSize: 24),
                      primary: Colors.red,
                      onPrimary: Colors.black
                    ),
                    onPressed: _validate,
                    child: Text("Search Buses",style: TextStyle(color: Colors.white),)
                  ),
                  SizedBox(height: 20),
                  Text("Top destination",style: TextStyle(fontSize: 30,color:Color(0xFF3b3b3b),fontWeight: FontWeight.bold),),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              children: citylist.map((city)=> City(city: city)).toList()
            ),
          ),
        ],
      ),
    );
  }

  void _validate() {
    final form = _formKey.currentState;
    if (form?.validate() == false) {
      return;
    }
    setState(() {
      var from = _fromController.text.toString();
      var To = _ToController.text.toString();
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => buslist(From: from,To: To)));
    });
  }

  void _showDatePicker() {
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2020), 
      lastDate: DateTime(2025)
    ).then((value) {
      setState(() {time = value!;});
    });
  }
}