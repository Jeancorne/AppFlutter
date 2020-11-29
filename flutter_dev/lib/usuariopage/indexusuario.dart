import 'package:flutter/material.dart';
import 'package:flutter_dev/Clases/clsUsuario.dart';
import 'package:flutter_dev/tabUsuario/solicitudUsuario.dart';
import 'package:flutter_dev/tabs/inicio.dart';
import 'package:flutter_dev/tabUsuario/perfilusuario.dart';

var tok2;

class InicioUsuario extends StatefulWidget {
  /*  InicioUsuario(this.valee){
    print("constructor");
    valee = this.valee;
    print(valee.value);
  } */
  //FlutterSession().get("token").then((value) => tok2 = value);

  /*  void initState() async {
    
  } */

  @override
  _InicioUsuario createState() => _InicioUsuario();

  /* doSomeAsyncStuff() async {
    tok2 = await obtenerPreferencias();
    print("token de index");
    print(tok2);
  } */
}

class _InicioUsuario extends State<InicioUsuario> {
  @override
  void initState() {
    super.initState();
    //doSomeAsyncStuff();
    /*   doSomeAsyncStuff().then((val) {
        print("aqui dome some");
        tok2 = val;
    }); */
    /* WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      obtenertoken();
    }); */
  }

  static Map<int, Color> color = {
    //Color.fromRGBO(137, 255, 205, 50),
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
  //MaterialColor primeColor = MaterialColor(0xFF337C36, color);
  @override
  Widget build(BuildContext context) {
    clsUsuario perfilusuario = ModalRoute.of(context).settings.arguments;
    final tabController = new DefaultTabController(
        length: 4,
        child: new Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: new AppBar(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0))),
              //title: Text('default value'),
              title: Text(
                perfilusuario.nombre != null
                    ? 'Bienvenido: ' + perfilusuario.nombre
                    : 'default value',
                style: TextStyle(color: Colors.white),
              ),
              bottom: new TabBar(
                  /* indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blue), */
                  onTap: (index) {
                    //print(index);
                   /*  final FocusScopeNode focus = FocusScope.of(context);
                    if (!focus.hasPrimaryFocus && focus.hasFocus) {
                      FocusManager.instance.primaryFocus.unfocus();
                    } */
                  },
                  indicatorColor: Color.fromRGBO(53, 183, 54, 50),
                  indicator: UnderlineTabIndicator(
                      insets: EdgeInsets.symmetric(horizontal: 16.0)),
                  labelColor: Colors.white,
                  tabs: <Widget>[
                    new Tab(
                      icon: new Icon(Icons.home),
                      text: "Inicio",
                    ),
                    new Tab(
                      icon: new Icon(Icons.how_to_reg_rounded),
                      text: "Perfil",
                    ),
                    new Tab(
                      icon: new Icon(Icons.how_to_vote),
                      text: "Solicitud",
                    ),
                    new Tab(
                      icon: new Icon(Icons.vpn_key),
                      text: "Perfil",
                    ),
                  ])),
          body: new TabBarView(children: <Widget>[
            new Inicio(),
            new FormPerfil(perfilusuario),
            new FormularioSolicitud(perfilusuario),
            new FormPerfil(perfilusuario),
          ]),
        ));

    return new MaterialApp(
      title: "Nama Bar",
      theme: new ThemeData(
        primarySwatch: this.primeColor,
      ),
      home: tabController,
      routes: {
        "/login": (context) {      
          //clsUsuario usuarionw = new clsUsuario(null,null,null,null,null);
          //.getperfil(perfilusuario.id, perfilusuario.token);
          //usuarionw = perfilusuario.getperfil(perfilusuario.id, perfilusuario.token);
          //perfilusuario = ModalRoute.of(context).settings.arguments;
          return new InicioUsuario();
        }
      },
    );
  }

/*   Future<String> obtenertoken =   Future<String>((){
      tok2 = obtenerPreferencias();
      print("aqui token");
      print(tok2);
  }); */

  /* void obtenertoken() async {
    tok2 = await obtenerPreferencias();
    print("token de index");
    print(tok2);
  } */
}

/* 
class InicioUsuario extends StatelessWidget {
  static Map<int, Color> color = {
    50: Color.fromRGBO(53, 183, 54, .1),
    100: Color.fromRGBO(53, 183, 54, .2),
    200: Color.fromRGBO(53, 183, 54, .3),
    300: Color.fromRGBO(53, 183, 54, .4),
    400: Color.fromRGBO(53, 183, 54, .5),
    500: Color.fromRGBO(53, 183, 54, .6),
    600: Color.fromRGBO(53, 183, 54, .7),
    700: Color.fromRGBO(53, 183, 54, .8),
    800: Color.fromRGBO(53, 183, 54, .9),
    900: Color.fromRGBO(53, 183, 54, 1),
  };
  MaterialColor primeColor = MaterialColor(0xFF337C36, color);
  @override
  Widget build(BuildContext context) {
    final tabController = new DefaultTabController(
        length: 4,
        child: new Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: new AppBar(
              title: new Text("Inicio usuario..."),
              bottom: new TabBar(
                  indicatorColor: Color.fromRGBO(53, 183, 54, 50),
                  tabs: <Widget>[
                    new Tab(
                      icon: new Icon(Icons.home),
                      text: "Inicio",
                    ),
                    new Tab(
                      icon: new Icon(Icons.vpn_key),
                      text: "Perfil",
                    ),
                  ])),
          body: new TabBarView(children: <Widget>[
            new Inicio(),
            new Inicio(),
          ]),
        ));
    /* return new MaterialApp(
      title: "Nama Bar",
      theme: new ThemeData(
        primarySwatch: this.primeColor,
      ),
      home: tabController,
    ); */
  }
} */
