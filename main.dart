// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'BMI CALCULATOR MODULE 1'),
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
  String name = "Pushpraj singh pawar".toLowerCase();
  var Weightt = TextEditingController();
  var Heightt = TextEditingController();
  var Agee = TextEditingController();
  var BMII = TextEditingController();
  double bmi = 0.0;
  // var Bmii    = TextEditingController();

  var t = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.1,
          color: Color.fromARGB(255, 255, 227, 148),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Color.fromARGB(255, 255, 199, 199),
                child: Row(
                  children: [
                    Text('Weight'),
                    Text(' *in kg     '),
                    Container(
                      width: 140,
                      height: 60,
                      color: Color.fromARGB(255, 255, 255, 0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: Weightt,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Color.fromARGB(255, 255, 199, 199),
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text('Height'),
                    Text(' *in cm    '),
                    Container(
                      width: 140,
                      height: 60,
                      color: Color.fromARGB(255, 255, 255, 0),
                      child: TextField(
                        controller: Heightt,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Color.fromARGB(255, 255, 199, 199),
                child: Row(
                  children: [
                    Text('Age'),
                    Text('  *in years    '),
                    Container(
                      width: 140,
                      height: 60,
                      color: Color.fromARGB(255, 255, 255, 0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: Agee,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  // ignore: duplicate_ignore
                  onPressed: () {
                    setState(
                      (){
                        int Wt = int.parse(Weightt.text.toString());
                    double Ht = double.parse(Heightt.text.toString());
                    Ht = Ht / 100;
                    int Ag = int.parse(Agee.text.toString());
                    double bmi = Wt / (Ht * Ht);
                    double bmi2 = double.parse((bmi).toStringAsFixed(2));

                    // ignore: unused_local_variable
                    print(Wt);
                    print(Ht);
                    print(Ag);
                    print('bmi = $bmi , $bmi2');
                    BMII.text = bmi2.toString();
                    print('**************************************');
                      }
                    );
                  },
                  child: Text('Calculate The Bmi ')),
              SizedBox(
                width: 500,
                child: Table(
                  border: TableBorder.all(),
                  children: [
                    TableRow(children: [
                      Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text('Your BMI '),
                        ],
                      ),
                      Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            'UnderWeight',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text('Fit BMI'),
                        ],
                      ),
                      Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            'OverWeight BMI',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      )
                    ]),
                    TableRow(children: [
                      Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(BMII.text),
                        ],
                      ),
                      Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text('<18.5'),
                        ],
                      ),
                      Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text('18.5-25'),
                        ],
                      ),
                      Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text('25<'),
                        ],
                      )
                    ]),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
