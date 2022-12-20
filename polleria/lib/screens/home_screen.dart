import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:polleria/model/user_model.dart';
import 'package:polleria/pages/paginaHome.dart';
import 'package:polleria/pages/paginaUser.dart';
import 'package:polleria/screens/login_screen.dart';
import 'package:polleria/screens/registration_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  int _paginaActual = 0;
  List<Widget> _paginas = [
    PaginaHome("Delivery"),
    PaginaUser(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 85,
        backgroundColor: Color.fromARGB(255, 196, 144, 114),
        title: Text(
          'Delivery',
          style: TextStyle(
            fontFamily: 'Regular',
            fontSize: 60,
            color: Color.fromARGB(255, 8, 8, 3),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.cyan,
      body: _paginas[_paginaActual],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 82, 49, 1),
        onTap: (index) {
          setState(() {
            _paginaActual = index;
          });
        },
        currentIndex: _paginaActual,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 104, 33, 0),
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 212, 78, 0),
            icon: Icon(Icons.person),
            label: "Perfil",
          ),
        ],
      ),
    );
  }
}
