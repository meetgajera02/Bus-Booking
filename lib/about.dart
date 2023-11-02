import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class About extends StatelessWidget {
  const About({super.key});

  
  @override
  Widget build(BuildContext context) {
    var about = "We are Bus - World's largest online bus-ticketing organization. At Bus, you can check bus schedules, select your favorite bus, view seat layout, pay and get your bus ticket - All with a few click of your mouse or a few taps on your phonw! Bus has over 36 million happy customers with 3500+ operators and has sold more than 220 million tickets globally! Book with us for a quick and hassle-free bus booking experience!";
    return Scaffold(
      backgroundColor: Color(0xFFeeedf2),
      appBar: AppBar(
        backgroundColor: Color(0xfffa5951),
        leading: BackButton(
          onPressed: ()=>Navigator.pop(context,false),
        ),
        title:  Text("About us",style: TextStyle(fontSize: 26,color:Color.fromARGB(255, 255, 255, 255),fontWeight: FontWeight.w400)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(35),
          child: Column(        
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset('assets/images/bus_icon.png')
                ),
              ),
              SizedBox(height: 10),
              Text(about, style: Theme.of(context).textTheme.bodyText1,textAlign: TextAlign.justify),
              SizedBox(height: 20),
              ListTile(
                onTap: (){},
                leading: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Image.asset('assets/images/about_icon.png')
                ),
                title: Text("Version: 20.5.1",style: Theme.of(context).textTheme.headline5),
              )
            ],
          ),
        ),
      ),
    );
  }
}