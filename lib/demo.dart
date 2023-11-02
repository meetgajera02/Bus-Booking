import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  String name = "";
  String email = "";
  String gender = "Male";
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  bool isCESelected = false;
  bool isITSelected = false;
  bool is10thChecked = false;
  bool is12thChecked = false;
  bool isBTechChecked = false;
  bool isDiplomaChecked = false;

  void _saveDataAndNavigate() {
    String savedData = '''
    Name: $name
    Email: $email
    Gender: $gender
    CE : $isCESelected
    IT : $isITSelected''';
    Navigator.push(context,MaterialPageRoute(builder: (context) => DisplayDataScreen(savedData)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Registration Form",style: TextStyle(color: Colors.white))
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.person),
                  ),
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                Row(
                  children: [
                    Text('Gender: '),
                    Radio(
                      value: 'Male',
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      },
                    ),
                    Text('Male'),
                    Radio(
                      value: 'Female',
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      },
                    ),
                    Text('Female'),
                  ],
                ),
                Row(
                  children: [
                    Text('CE : '),
                    Switch(
                      value: isCESelected,
                      onChanged: (value) {
                        setState(() {
                          isCESelected = value;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('IT : '),
                    Switch(
                      value: isITSelected,
                      onChanged: (value) {
                        setState(() {
                          isITSelected = value;
                        });
                      },
                    ),
                  ],
                ),
                Text('Qualification:'),
                CheckboxListTile(
                  title: Text('10th'),
                  value: is10thChecked,
                  onChanged: (value) {
                    setState(() {
                      is10thChecked = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('12th'),
                  value: is12thChecked,
                  onChanged: (value) {
                    setState(() {
                      is12thChecked = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('B.Tech'),
                  value: isBTechChecked,
                  onChanged: (value) {
                    setState(() {
                      isBTechChecked = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Diploma'),
                  value: isDiplomaChecked,
                  onChanged: (value) {
                    setState(() {
                      isDiplomaChecked = value!;
                    });
                  },
                ),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(150, 50),
                          textStyle: TextStyle(fontSize: 21),
                          primary: Colors.red,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      onPressed: _saveDataAndNavigate,
                      child: Text('Save'),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(150, 50),
                          textStyle: TextStyle(fontSize: 21),
                          primary: Colors.red,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                      ),
                      onPressed: () {
                        setState(() {
                          name = "";
                          email = "";
                          gender = "Male";
                          isCESelected = false;
                          isITSelected = false;
                          is10thChecked = false;
                          is12thChecked = false;
                          isBTechChecked = false;
                          isDiplomaChecked = false;
                          _emailController.clear();
                          _nameController.clear();
                        });
                      },
                      child: Text('Cancel'),
                    ),
                  ],
                ),
                ListView(
                  key: _formKey,
                  
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DisplayDataScreen extends StatelessWidget {
  final String savedData;

  DisplayDataScreen(this.savedData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Saved Data")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          savedData,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}