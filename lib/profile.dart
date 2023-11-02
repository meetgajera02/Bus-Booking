import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'data.dart';

class regitrationPage extends StatefulWidget {
  regitrationPage({super.key});

  @override
  State<regitrationPage> createState() => _regitrationPageState();
}

class _regitrationPageState extends State<regitrationPage> {

  TextEditingController _NameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffa5951),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment:  CrossAxisAlignment.center,
              children:  [
                Container(
                  width:  double.infinity,
                  height:  225,
                  child: Stack(
                    children:  [
                      Positioned(
                        left:  0,
                        top:  0,
                        child:  Align(
                          child:  SizedBox(
                            child:  Image.asset('assets/images/Cricle4.png')
                          )
                        )
                      ),
                      Positioned(
                        left:  40,
                        top:  159,
                        child: Align(
                          child: SizedBox(
                            child: Text('Create\nAccount',style:  TextStyle (fontSize:  30,fontWeight:  FontWeight.w600,height:  1.2125,color:  Color(0xffffffff)))
                          )
                        )
                      ),
                    ],
                  ),
                ),
              Container(
                padding:  EdgeInsets.fromLTRB(40, 20, 40, 40),
                width:  double.infinity,
                child: Column(
                  crossAxisAlignment:  CrossAxisAlignment.center,
                  children:  [
                  Container(
                    child:  TextFormField(
                      controller: _NameController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 18,color: Colors.white),
                      decoration: InputDecoration(
                        filled: false,
                        hintText: "Name",
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(Icons.person_outline,color: Colors.white),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30)
                        )
                      ),
                    ),
                ),
                Container(
                  margin:  EdgeInsets.fromLTRB(0, 0, 0, 15),
                  width:  double.infinity,
                  height:  1,
                  decoration:  BoxDecoration (
                    color:  Colors.white
                  ),
                ),
                Container(
                    child:  TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 18,color: Colors.white),
                      validator: (text){
                              bool _email = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text!);
                              if(text!.isEmpty){
                                return'Enter Email';
                              }
                              else if(!_email){
                                return "Enter Valid Email";
                              }
                            },
                      decoration: InputDecoration(
                        filled: false,
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(Icons.email,color: Colors.white),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30)
                        )
                      ),
                    ),
                ),
                Container(
                  margin:  EdgeInsets.fromLTRB(0, 0, 0, 15),
                  width:  double.infinity,
                  height:  1,
                  decoration:  BoxDecoration (
                    color: Colors.white
                  ),
                ),
                Container(
                    child:  TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 18,color: Colors.white),
                      decoration: InputDecoration(
                        filled: false,
                        hintText: "Phone",
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(Icons.phone,color: Colors.white),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30)
                        )
                      ),
                    ),
                ),
                Container(
                  margin:  EdgeInsets.fromLTRB(0, 0, 0, 15),
                  width:  double.infinity,
                  height:  1,
                  decoration:  BoxDecoration (
                    color: Colors.white
                  ),
                ),
                Container(
                  child:  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 18,color: Colors.white),
                    decoration: InputDecoration(
                      filled: false,
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(Icons.key_outlined,color: Colors.white),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(30)
                      )
                    ),
                  ),
                ),
                Container(
                  margin:  EdgeInsets.fromLTRB(0, 0, 0, 40),
                  width:  double.infinity,
                  height:  1,
                  decoration:  BoxDecoration (
                    color: Colors.white
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(400, 60),
                    textStyle: TextStyle(fontSize: 24),
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)
                    )
                  ),
                  onPressed: (){
                    final form = _formKey.currentState;
                    if (form?.validate() == false) {
                      return;
                    }
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: _emailController.text, 
                      password: _passwordController.text
                    ).then((value) {
                      print('Create New Account');
                      Navigator.push(context, MaterialPageRoute(builder: (context) => data()));
                    }).onError((error, stackTrace) {
                      print('Error ${error.toString()}');
                    });
                    _NameController.clear();
                    _emailController.clear();
                    _phoneController.clear();
                    _passwordController.clear();
                  },
                  child: Text("SIGN UP",style: TextStyle(color: Color(0xfffa5951)))
                ),
              ],
            ),
          ),
          Container(
            width:  double.infinity,
            height:  85,
            child: Stack(
              children: [
                Positioned(
                  bottom:  0,
                  left: 0,
                  child: Align(
                    child: SizedBox(
                      child: Image.asset('assets/images/Cricle3.png')
                    )
                  )
                ),
                Positioned(
                  left:  65,
                  bottom:  0,
                  child: Align(
                    child: SizedBox(
                      child:  TextButton(
                        onPressed: (){},
                        child: Text('Already have an account?',style:  TextStyle (fontSize:  14,fontWeight:  FontWeight.w400,height:  1.2125,color:  Colors.white))
                      )
                    )
                  )
                ),
                Positioned(
                  right:  85,
                  bottom:  0,
                  child: Align(
                    child: SizedBox(
                      child:  TextButton(
                        onPressed: (){},
                        child: Text('SIGN IN',style:  TextStyle (fontSize:  14,fontWeight:  FontWeight.w400,height:  1.2125,color:  Color(0xfffa5951)))
                      )
                    )
                  )
                ),
              ],
            ),
           ),
          ],
              ),
              ),
        ),
      ),
    );
  }
}