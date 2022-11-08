import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class secondpage extends StatefulWidget {
  secondpage({required this.bmi});

    double bmi;



  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "results"
        )
      ),
      body:Center(child:Column(
        children: [
          GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child:Container(
                  child: Text("recalculate")
              )
          ),
          
          Text("your BMI is ${widget.bmi})",
          style:TextStyle(color: Colors.lightBlue,fontSize: 30,fontWeight: FontWeight.bold),

          ),
          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          )],
      )
    ));
  }
}
