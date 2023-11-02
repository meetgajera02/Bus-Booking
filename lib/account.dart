import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'update_Profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'booking.dart';
import 'about.dart';
import 'setting.dart';
import 'feedback.dart';

class Profile extends StatefulWidget {
  const Profile({Key?key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFeeedf2),
      appBar: AppBar(
        backgroundColor: Color(0xfffa5951),
        title:  Text("Profile",style: TextStyle(fontSize: 26,color:Color.fromARGB(255, 255, 255, 255),fontWeight: FontWeight.w400)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(35),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset('assets/images/meet.JPG')
                ),
              ),
              SizedBox(height: 10),
              Text("Meet Gajera",style: Theme.of(context).textTheme.headline4),
              Text("meetgajera413@gmail.com",style: Theme.of(context).textTheme.bodyText2),
              SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: (){
                        Navigator.push(context, 
                          MaterialPageRoute(builder: (context)=>updated())
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,shape: StadiumBorder()
                  ),
                  child:Text('Edit Profile',style: TextStyle(color: Colors.black)) 
                )
              ),
              SizedBox(height: 30),
              Divider(),
              SizedBox(height: 10),
              prifilemenu(title: 'My Booking',icon: FontAwesomeIcons.ticket,onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>booking()));}),
              prifilemenu(title: 'Help',icon: FontAwesomeIcons.checkToSlot,onPressed: (){}),
              prifilemenu(title: 'About us',icon: FontAwesomeIcons.exclamationCircle,onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>About()));}),
              prifilemenu(title: 'Setting',icon: FontAwesomeIcons.cog,onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Setting()));}),
              prifilemenu(title: 'Feedback',icon: FontAwesomeIcons.book,onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>feedback()));}),
              Divider(),
              prifilemenu(
                title: 'Logout',
                icon: FontAwesomeIcons.signOut,
                onPressed: signOut,
                TextColor: Colors.red,
                endIcon: false
              ),                
            ],
          ),
        ),
      ),
    );
  }
  void signOut(){
    FirebaseAuth.instance.signOut();
  }
}

class prifilemenu extends StatelessWidget {
  const prifilemenu({Key? key,
  required this.title,
  required this.icon,
  required this.onPressed,
  this.endIcon = true,
  this.TextColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final bool endIcon;
  final Color? TextColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey.withOpacity(0.2)
        ),
        child: Icon(icon),
      ),
      title: Text(title,style: TextStyle(fontSize: 21,color:Color(0xFF3b3b3b),fontWeight: FontWeight.w500).apply(color: TextColor)),
      trailing: endIcon? Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey.withOpacity(0.1)
        ),
        child: Icon(FontAwesomeIcons.angleRight, color: Colors.grey,size: 18.0)):null
    );
  }
}