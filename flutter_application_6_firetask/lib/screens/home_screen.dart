import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6_firetask/model/user_model.dart';
import 'package:flutter_application_6_firetask/pages/paginaHome.dart';
import 'package:flutter_application_6_firetask/pages/paginaUser.dart';
import 'package:flutter_application_6_firetask/screens/login_screen.dart';
import 'package:flutter_application_6_firetask/screens/registration_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  int _paginaActual = 0;
  List<Widget> _paginas = [
    PaginaHome(),
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
            backgroundColor: Color.fromARGB(255, 82, 49, 1),
            icon: Icon(Icons.food_bank_outlined),
            label: "Pollo",
          ),
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

class PaginaHome extends StatelessWidget {
  const PaginaHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 104, 33, 0),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              color: Colors.brown,
              borderOnForeground: true,
              child: TextButton(
                child: Image.asset(
                  'assets/pollo.jpg',
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PolloPlato(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Card(
              color: Colors.brown,
              borderOnForeground: true,
              child: TextButton(
                child: Image.asset(
                  'assets/pollo1.jpg',
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PolloPlato(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Card(
              color: Colors.brown,
              borderOnForeground: true,
              child: TextButton(
                child: Image.asset(
                  'assets/pollo2.jpg',
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PolloPlato(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

}