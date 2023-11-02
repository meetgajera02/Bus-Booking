import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';



class data extends StatelessWidget {
   data({super.key});

  final nameController =TextEditingController();
  final emailController =TextEditingController();
  final mobileController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Name"
              ),
              
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "email"
              ),
            ),
            TextFormField(
              controller: mobileController,
              decoration: InputDecoration(
                hintText: "mobile"
              ),
            ),
            ElevatedButton(
              onPressed: (){
                CollectionReference collRef = FirebaseFirestore.instance.collection('client');
                collRef.add({
                  'name':nameController.text,
                  'email':emailController.text,
                  'mobile':mobileController.text,
                });
                nameController.clear();
                emailController.clear();
                mobileController.clear();
              }, 
              child: Text('Add data')
            ),
            SizedBox(height:20),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('client').snapshots(),
              builder: (context,snapshot) {
                List<Row> clientWidgets = [];
                if(snapshot.hasData){
                  final clients = snapshot.data?.docs.reversed.toList();
                  for(var client in clients!){
                    final clientWidget = Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                        Text(client['name']),
                        Text(client['email']),
                        Text(client['mobile']),
                       ],
                    );
                    clientWidgets.add(clientWidget);
                  }
                }
                return Expanded(
                  child: ListView(
                    children: clientWidgets,
                  ),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}

