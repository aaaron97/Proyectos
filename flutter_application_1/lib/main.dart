import 'dart:html';

import 'package:flutter/material.dart';

void(){
  runApp(MaterialApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override 
  Widget build (BuildContext context){
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60.0,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(
                "https://scontent.fcuz1-1.fna.fbcdn.net/v/t1.6435-9/204704737_4296809537045024_593767051009591612_n.jpg"),
              ),
              Text("Iris Bocangel Olazabal"), 
           
          ]
          ),
      ),
    );
  }
}