import 'package:flutter/material.dart';
import 'dart:async';
//import 'package:flutter/foundation.dart';

void main()=> runApp(MainPage());


class MainPage extends StatefulWidget{
  MyApp createState()=> MyApp();

}


class MyApp extends State<MainPage>{
static const duration= const Duration(seconds: 1);
  int secondsPassed=0;
  bool isActive=false;
Timer timer;

void handleTick(){
  if(isActive){
    setState(() {
      secondsPassed=secondsPassed+1;
    });
  }
}


  @override
  void initState() {
    timer=Timer.periodic(duration, (Timer t){
      handleTick();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

  int seconds=secondsPassed%60;
  int minutes=secondsPassed~/60;
  int hours=secondsPassed~/3600;

    return MaterialApp(
      title: 'Welcome to flutter',
      home: Scaffold(
      appBar: AppBar(
        title: Text('Timer'),
      ),
        body: Center(
          child :Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomTextContainer(label: 'HRS',value: hours.toString()),
                  CustomTextContainer(label: 'MIN',value: minutes.toString()),
                  CustomTextContainer(label: 'SEC',value: seconds.toString()),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: RaisedButton(
                  child: Text(isActive ?'STOP':'START'),
                  onPressed: (){
                    //on button tapped
                    if(isActive){
                      setState(() {
                        isActive=false;
                       // debugPrint('true');

                      });
                    }else{
                      setState(() {
                        isActive=true;
                        //debugPrint('false');
                      });
              secondsPassed=0;
                    }


                  },
                ),
              )
            ],
          )

      ),
      ),
    );
  }

}

class CustomTextContainer extends StatelessWidget{
  CustomTextContainer({this.label,this.value});

  final String label;
  final String value;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.all(20),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(10),
        color: Colors.black87,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '$value',
            style: TextStyle(
              color: Colors.white,
              fontSize: 54,
              fontWeight: FontWeight.bold
            ),
          ),

          Text(
            '$label',
            style: TextStyle(
              color: Colors.white70,
            ),

          )
        ],
      ),//Column
    );//Container
  }
}


