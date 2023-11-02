import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dataredairect extends StatefulWidget {
  const dataredairect({super.key});

  @override
  State<dataredairect> createState() => _dataredairectState();
}

class _dataredairectState extends State<dataredairect> {

  @override
  void initState() {
    SearchController.addListener(_onSearchChange);
    super.initState();
  }

  _onSearchChange(){
    print(SearchController.text);
    searchResultList();
  }

  searchResultList(){
    var showResults = [];
    if (SearchController.text != ''){
      for (var clientSnapshot in _allResults){
        var name = clientSnapshot['name'].toString().toLowerCase();
        if(name.contains(SearchController.text.toLowerCase())){
          showResults.add(clientSnapshot);
        }
      }
    }
    else{
      showResults = List.from(_allResults);
    }
    setState(() {
      _resultList = showResults;
    });
  }

  @override
  void dispose() {
    SearchController.removeListener(_onSearchChange);
    SearchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    getClientStrem();
    super.didChangeDependencies();
  }

  List _allResults = [];
  List _resultList = [];
  final TextEditingController SearchController = TextEditingController();

  getClientStrem() async{
    var data = await FirebaseFirestore.instance.collection("client").orderBy("name").get();

    setState(() {
      _allResults = data.docs;
    });
    searchResultList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CupertinoSearchTextField(
          controller: SearchController,
        )
      ),
      body: ListView.builder(
        itemCount: _resultList.length,
        itemBuilder: (context,index){
          return ListTile(
            title: Text(_resultList[index]['name']),
            subtitle: Text(_resultList[index]['email']),
            trailing: Text(_resultList[index]['mobile']),
          );
        }
      ),
    );
  }
}