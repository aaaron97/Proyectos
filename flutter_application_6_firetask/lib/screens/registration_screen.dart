import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_application_6_firetask/model/user_model.dart';
import 'package:flutter_application_6_firetask/screens/home_screen.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  final firstNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final firstNameField = TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ('Campo requerido');
        }
        if (!regex.hasMatch(value)) {
          return ('Por favor ingresar un Nombre valida(Min. 3 caracteres');
        }
      },
      onSaved: (value) {
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person, color: Color.fromARGB(255, 0, 0, 0)),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Nombre',
        hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ('Por favor ingrese su Correo Electrónico');
        }

        if (!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]').hasMatch(value)) {
          return ('Por favor Ingrese un Correo Electrónico valido');
        }
        return null;
      },
      onSaved: (value) {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail, color: Color.fromARGB(255, 0, 0, 0)),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Correo Electrónico',
        hintStyle: TextStyle(color: Color.fromARGB(255, 2, 2, 2)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ('Se requiere contraseña para iniciar sesión');
        }
        if (!regex.hasMatch(value)) {
          return ('Por favor ingresar contraseña valida(Min. 6 caracteres');
        }
      },
      onSaved: (value) {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key, color: Color.fromARGB(255, 3, 3, 3)),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Contraseña',
        hintStyle: TextStyle(color: Color.fromARGB(255, 2, 2, 2)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordEditingController,
      obscureText: true,
      validator: (value) {
        if (confirmPasswordEditingController.text !=
            passwordEditingController.text) {
          return 'La contraseña no coincide';
        }
        return null;
      },
      onSaved: (value) {
        confirmPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key, color: Color.fromARGB(255, 0, 0, 0)),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Confirmar Contraseña',
        hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final signUpButton = Material(
      elevation: 9,
      color: Color.fromARGB(255, 167, 16, 5),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signUp(emailEditingController.text, passwordEditingController.text);
        },
        child: Text('REGISTRAR',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 85,
        backgroundColor: Color.fromARGB(255, 196, 144, 114),
        title: Text(
          'Registro',
          style: TextStyle(
            fontFamily: 'Regular',
            fontSize: 50,
            color: Color.fromARGB(255, 8, 8, 3),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 196, 144, 114),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Color.fromARGB(255, 196, 144, 114),
            child: Padding(
              padding: EdgeInsets.all(36),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                      child: Icon(
                        Icons.person_add_alt_sharp,
                        size: 200,
                      ),
                    ),
                    firstNameField,
                    SizedBox(height: 30),
                    emailField,
                    SizedBox(height: 30),
                    passwordField,
                    SizedBox(height: 30),
                    confirmPasswordField,
                    SizedBox(height: 30),
                    signUpButton,
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
        ..createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
    }
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel(email: '', nombre: '', uid: '');

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.nombre = firstNameEditingController.text;

    await firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: 'Cuenta creada satisfactoriamente :)');

    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
  }
}
