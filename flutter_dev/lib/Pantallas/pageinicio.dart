import 'package:flutter/material.dart';
import 'package:flutter_dev/tabs/inicio.dart';
import 'package:flutter_dev/tabs/loggin.dart';
import 'package:flutter_dev/tabs/registro.dart';

int indexactual;

class Paginainicio extends StatefulWidget {
  int index = 0;
  Paginainicio(this.index) {
    indexactual = index;
  }
  _PaginaInicio createState() => _PaginaInicio();
}

class _PaginaInicio extends State<Paginainicio> {
  static Map<int, Color> color = {
    50: Color.fromRGBO(137, 255, 205, .1),
    100: Color.fromRGBO(137, 255, 205, .2),
    200: Color.fromRGBO(137, 255, 205, .3),
    300: Color.fromRGBO(137, 255, 205, .4),
    400: Color.fromRGBO(137, 255, 205, .5),
    500: Color.fromRGBO(137, 255, 205, .6),
    600: Color.fromRGBO(137, 255, 205, .7),
    700: Color.fromRGBO(137, 255, 205, .8),
    800: Color.fromRGBO(137, 255, 205, .9),
    900: Color.fromRGBO(137, 255, 205, 1),
  };
  MaterialColor primeColor = MaterialColor(0xFF0EC3E8, color);

  final tabs = [
    Center(child: Inicio()),
    Center(child: LoginPage()),
    Center(child: Registro()),
    Center(child: Inicio()),
  ];
/* w Inicio(),
            new Loggin(),
            new Registro(),
            new Inicio(),
 */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(                
        backgroundColor: primeColor,
        title: Text("Proyecto..."),
      ),
      body: tabs[indexactual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexactual,
        iconSize: 25,
        items: [
          BottomNavigationBarItem(
              title: Text("Inicio"),
              icon: new Icon(Icons.home),
              backgroundColor: Colors.lightBlue),
          BottomNavigationBarItem(
              icon: new Icon(Icons.vpn_key),
              title: Text("Loggin"),
              backgroundColor: Colors.cyan),
          BottomNavigationBarItem(
              icon: new Icon(Icons.account_box_rounded),
              title: Text("Registro"),
              backgroundColor: Colors.blueGrey),
          BottomNavigationBarItem(
              icon: new Icon(Icons.feedback),
              title: Text("Acerca de"),
              backgroundColor: Color.fromRGBO(53, 183, 54, 50)),
        ],
        onTap: (index) {
          setState(() {
            FocusScope.of(context).unfocus();
            indexactual = index;
          });
        },
      ),
    );
  }
  /* Widget build(BuildContext context) {
   final tabController = new DefaultTabController(
       length: 4,
      child: new Scaffold(
        resizeToAvoidBottomInset: true,       
        appBar: new AppBar(
          title: new Text("Proyecto..."),
          bottom: new TabBar(
            indicatorColor: Color.fromRGBO(53, 183, 54, 50),
            tabs: <Widget>[
              new Tab(
                icon: new Icon(Icons.home),
                text: "Inicio",
              ),
              new Tab(
                icon: new Icon(Icons.vpn_key),
                text: "Loggin",
              ),
              new Tab(
                icon: new Icon(Icons.account_box_rounded),
                text: "Registro",
              ),
              new Tab(
                icon: new Icon(Icons.feedback),
                text: "Acerca de",
              )
            ],
          ),
        ),
        body: new TabBarView(
          children: <Widget>[
            new Inicio(),
            new Loggin(),
            new Registro(),
            new Inicio(),
          ],
        ),
      ),
    );
    return MaterialApp(      
      title: "Nama Bar",      
      theme: new ThemeData(
        primarySwatch: this.primeColor,
      ),
      home: tabController,
    );  

  } */

}

/*  @override
  Widget build(BuildContext context) {
    final tabController = new DefaultTabController(
      length: 4,
      child: new Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: new AppBar(
          title: new Text("Proyecto..."),
          bottom: new TabBar(
            indicatorColor: Color.fromRGBO(53, 183, 54, 50),
            tabs: <Widget>[
              new Tab(
                icon: new Icon(Icons.home),
                text: "Inicio",
              ),
              new Tab(
                icon: new Icon(Icons.vpn_key),
                text: "Loggin",
              ),
              new Tab(
                icon: new Icon(Icons.account_box_rounded),
                text: "Registro",
              ),
              new Tab(
                icon: new Icon(Icons.feedback),
                text: "Acerca de",
              )
            ],
          ),
        ),
        body: new TabBarView(
          children: <Widget>[
            new Inicio(),
            new Loggin(),
            new Registro(),
            new Inicio(),
          ],
        ),
      ),
    );
    return new MaterialApp(
      title: "Nama Bar",
      theme: new ThemeData(
        primarySwatch: this.primeColor,
      ),
      home: tabController,
    );
  }
} */
