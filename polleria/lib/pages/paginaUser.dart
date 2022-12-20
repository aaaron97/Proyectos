import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:polleria/screens/login_screen.dart';
import 'package:polleria/model/user_model.dart';

class PaginaUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 300,
              child: Icon(Icons.person, size: 300),
            ),
            const Text(
              'Bienvenido',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Nombre',
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
            ),
            Text(
              'Email',
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 15,
            ),
            ActionChip(
                backgroundColor: Colors.red,
                label: const Text('Desconectar'),
                onPressed: () {
                  logout(context);
                }),
          ],
        ),
      )),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
