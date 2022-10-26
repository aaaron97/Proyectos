import 'package:flutter/material.dart';

class MyAppForm extends StatefulWidget {
  const MyAppForm({super.key});

  @override
  State<MyAppForm> createState() => _MyAppFormState();
}

class _MyAppFormState extends State<MyAppForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 161, 193, 249),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 50,vertical: 70
        ),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100.0,
                backgroundColor: Color.fromARGB(255, 164, 196, 250),
                backgroundImage: AssetImage('imagenes/laLiga.png'),
                 ),
                    Divider(),
            Card(
              margin: EdgeInsets.all(10.0),
              child: ListTile(
                title: Text("Email Adress"),
                subtitle: Text("Username@gmail.com"),
                leading: Icon(Icons.email,color: Color.fromARGB(255, 33, 30, 30)),
              ),
            ),
              Card(
              margin: EdgeInsets.all(10.0),
              child: ListTile(
                title: Text("Password"),
                subtitle: Text("______"),
                leading: Icon(Icons.lock_open,
                    color: Color.fromARGB(255, 17, 17, 17)),
                trailing: Icon(Icons.remove_red_eye_sharp),
              ),
            ),
              Card(color: Colors.blue,
              
              margin: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
              child: ListTile(
               
                title: Text("Login",style: TextStyle(color: Colors.white)),
               
              ),
            ),
  
            ],
          )
        ],

      ),

    );
   
   
  }
}
