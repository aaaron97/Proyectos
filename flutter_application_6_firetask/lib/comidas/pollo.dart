import 'package:flutter/material.dart';

class PolloPlato extends StatefulWidget {
  const PolloPlato({Key? key}) : super(key: key);

  @override
  State<PolloPlato> createState() => _PolloPlatoState();
}

class _PolloPlatoState extends State<PolloPlato> {
  String? casillas = 'tamaño';
  String? crema = 'crema';

  @override
  Widget build(BuildContext context) {
    final signUpButton = Material(
      elevation: 5,
      color: Color.fromARGB(255, 190, 78, 3),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {},
        child: const Text('REALIZAR PEDIDO',
            style: TextStyle(
              color: Colors.white,
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
          'Delivery',
          style: TextStyle(
            fontFamily: 'Regular',
            fontSize: 70,
            color: Color.fromARGB(255, 8, 8, 3),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 196, 144, 114),
      body: Theme(
        data: ThemeData(
          unselectedWidgetColor: Colors.white,
        ),
        child: Center(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 800,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.asset('assets/pollo.jpg'),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: const Center(
                    child: Text(
                      'Detalles',
                      style: TextStyle(
                          height: 1.2, fontSize: 45, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    heightFactor: 0,
                    child: Text(
                      'Elija el tamaño de su pedido',
                      style: TextStyle(
                          height: 2, fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
                RadioListTile(
                  title: Text('1/8 de pollo',
                      style: TextStyle(color: Colors.white)),
                  value: '1/8',
                  groupValue: casillas,
                  onChanged: (value) {
                    setState(() {
                      casillas = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text('1/4 de pollo',
                      style: TextStyle(color: Colors.white)),
                  value: '1/4',
                  groupValue: casillas,
                  onChanged: (value) {
                    setState(() {
                      casillas = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title:
                      Text('1/2 pollo', style: TextStyle(color: Colors.white)),
                  value: '1/2',
                  groupValue: casillas,
                  onChanged: (value) {
                    setState(() {
                      casillas = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text('1 pollo entero',
                      style: TextStyle(color: Colors.white)),
                  value: '1',
                  groupValue: casillas,
                  onChanged: (value) {
                    setState(() {
                      casillas = value.toString();
                    });
                  },
                ),
                Container(
                  child: Center(
                    heightFactor: 0,
                    child: Text(
                      'Seleccione sus cremas',
                      style: TextStyle(
                          height: 2, fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                RadioListTile(
                  title: Text('Ají', style: TextStyle(color: Colors.white)),
                  value: 'Ají',
                  contentPadding: EdgeInsets.zero,
                  groupValue: crema,
                  onChanged: (value) {
                    setState(() {
                      crema = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Mostaza', style: TextStyle(color: Colors.white)),
                  value: 'Mostaza',
                  contentPadding: EdgeInsets.zero,
                  groupValue: crema,
                  onChanged: (value) {
                    setState(() {
                      crema = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title:
                      Text('Mayonesa', style: TextStyle(color: Colors.white)),
                  value: 'Mayonesa',
                  contentPadding: EdgeInsets.zero,
                  groupValue: crema,
                  onChanged: (value) {
                    setState(() {
                      crema = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Ketchu', style: TextStyle(color: Colors.white)),
                  value: 'Ketchu',
                  contentPadding: EdgeInsets.zero,
                  groupValue: crema,
                  onChanged: (value) {
                    setState(() {
                      crema = value.toString();
                    });
                  },
                ),
                signUpButton,
              ],
            ),
          ),
        )),
      ),
    );
  }
}
