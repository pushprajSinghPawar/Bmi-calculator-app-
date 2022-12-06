// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, non_constant_identifier_names, avoid_print

// import 'dart:html';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: true,
      debugShowCheckedModeBanner: false,
      title: 'Diet Monitor App',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const MyHomePage(title: 'Food to calorie calculator CALCULATOR MODULE 1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String api_url = 'https://api.api-ninjas.com/v1/nutrition?query=200gram chapati';
  String Responses ='';
  Future getFoodNutrients() async{
    http.Response res;
    res = await http.get(Uri.parse(api_url), headers: {"X-CMC_PRO_API_KEY": 'AWvZwBBO44qZdYfDi4xxTg==VwWnIO1g63GnAdVd'});
    if(res.statusCode == 200){
      Responses = res.body;
    }
    print(Responses);
    return res;
  }
  final foodItem = TextEditingController();
  var printebl = TextEditingController();
  String Fooditem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 233, 248, 255),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: 310,
          height: 900,
          color: Color.fromARGB(255, 233, 220, 83),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: foodItem,
                  decoration: InputDecoration( border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: (){
                      foodItem.clear();
                    },
                    icon: Icon(Icons.clear),
                  ),
                  ),
                
                ),
                ElevatedButton(onPressed:(){
                  // var res = await http.get(Uri.parse('https://api.api-ninjas.com/v1/nutrition?query=200gram chapati'));
                  // print(res);

                  setState(() {
                    Fooditem= foodItem.text.toString();
                  });
                  print(Fooditem.toString());
                },
                child: Text('Convert this to calories')),
                Text(Fooditem),
                Text(Responses),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
