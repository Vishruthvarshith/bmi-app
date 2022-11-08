
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:untitled4/secondpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double height = 175;
  int weight = 45;
  double bmi = 0;


  void add() {
    setState(() {
      weight++;
    });
  }

  void minus() {
    setState(() {
      if (weight != 0) weight--;
    });
  }
  void BMI(){
    bmi = (weight / pow(height / 100, 2));
    print(bmi);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(210, 10, 10, 10),
      appBar: AppBar(
        title: Text("BMI Calculator"),
        backgroundColor: Colors.blueGrey,
      ),

      body: Row(mainAxisAlignment:MainAxisAlignment.center,children:[
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(

                height: 100,
                width: 500,
                color: Colors.blueGrey,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: StadiumBorder(),
                          side: BorderSide(width: 2, color: Colors.black),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Enter your weight(kg):  ',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        child:
                        Text("-".toUpperCase(), style: TextStyle(fontSize: 25)),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(15)),
                            foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.yellow),
                            shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    side: BorderSide(color: Colors.black87)))),
                        onPressed: minus,
                      ),
                      Text('$weight',
                          style: TextStyle(fontSize: 55.0, color: Colors.red)),
                      ElevatedButton(
                        child:
                        Text("+".toUpperCase(), style: TextStyle(fontSize: 25)),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(15)),
                            foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black87),
                            shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    side: BorderSide(color: Colors.black87)))),
                        onPressed: add,
                      )
                    ]),
              ),
              Container(
                  height: 90,
                  width: 500,
                  color: Colors.blueGrey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [

                      Text(
                        "Height(cms) : ${height.round()}",
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.yellow,
                        ),
                      ),
                      Slider(
                          value: height,
                          min: 150,
                          max: 250,
                          onChanged: (value) {
                            setState(() {
                              height = value;
                              print(height);
                            });
                          })
                    ],
                  )),
              GestureDetector(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>secondpage(bmi: ((bmi*100).roundToDouble())/100,)));
                  },
                  child:Container(
                      child: Text("recalculate")
                  )
              ),
              ElevatedButton(
                child: Text(
                    "Calculate"),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(30)),
                    foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.black),
                    shape:
                    MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: BorderSide(color: Colors.black)))


                ),

                onPressed: BMI,
              ),
              SizedBox(height: 15),
              Text(
                  bmi == null ? "Enter Value" : " BMI is :${bmi.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,

                  ))
            ],
          )]
      ),
    );
  }
}




