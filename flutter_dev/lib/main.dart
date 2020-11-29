import 'package:flutter/material.dart';
import 'package:flutter_dev/tabs/registro.dart';
import 'package:flutter_dev/usuariopage/indexusuario.dart';

//import 'Controller/registroController.dart';
import 'Clases/clsUsuario.dart';
import 'Pantallas/pageinicio.dart';

var token;
Future<void> main() async {
  runApp(MyApp());
}
/* void main() {
  runApp(MyApp());
} */

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

const prima = Color(0x35B736);

class _MyAppState extends State<MyApp> {
  clsUsuario perfilusuario;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Matt',
      initialRoute: '/',
      routes: {
        "/": (BuildContext context) {
          var indexpage = ModalRoute.of(context).settings.arguments;
          if(indexpage == null) indexpage = 0;
          return Paginainicio(indexpage);
        },
        "/login": (context) {          
          //perfilusuario = ModalRoute.of(context).settings.arguments;
          return new InicioUsuario();
        }
      },
    );
  }

/*   Future obtenerPreferencias() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    tok = preferences.get("token") ?? "Su email";
    return null;
  } */
}

/* obtenertoken() async {
  token = obtenerPreferencias();
  print("token de main obtener");
  print(token);
  return token;
} */

/* class MyApp extends StatelessWidget {
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

/* class PantallaInicio extends StatelessWidget {
  @override
  
} */

//final formKey = GlobalKey<FormState>();

/* class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Registrarse en Nama';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text(appTitle),
          backgroundColor: Color.fromRGBO(53, 183, 54, 50),
        ),
        body: Formulario(),
      ),
    );
  }
} */

/* class Formulario extends StatefulWidget {
  @override
  CuerpoApp createState() {
    /* return CuerpoApp(); */
  }
}
 */
/* class CuerpoApp extends State<Formulario> {
  } */
/* final _formKey = GlobalKey<FormState>();
  String nombre;
  String apellido;
  String email;
  String contrasena1;
  String contrasena2;
  Map data; */

/*   @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Nombre: '),
              validator: (value) {
                if (value.isEmpty) {
                  return 'El nombre es obligatorio.';
                }
                return null;
              },
              onSaved: (value) {
                this.nombre = value;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Apellido: '),
              validator: (value) {
                if (value.isEmpty) {
                  return 'El apellido es obligatorio.';
                }
                return null;
              },
              onSaved: (value) {
                this.apellido = value;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email/Correo: '),
              validator: (value) {
                bool result = validateEmail(value);
                if (result == false) {
                  return 'Correo incorrecto.';
                }
                if (value.isEmpty) {
                  return 'El correo es obligatorio.';
                }
                return null;
              },
              onSaved: (value) {
                this.email = value;
              },
            ),
            TextFormField(
              onSaved: (value) {
                this.contrasena1 = value;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'La contraseña es obligatoria.';
                }
                return null;
              },
              decoration: InputDecoration(labelText: 'Contraseña:'),
              obscureText: true,
            ),
            TextFormField(            
              onSaved: (value) {
                this.contrasena2 = value;             
              },
              validator: (value) {
                if (this.contrasena1 != this.contrasena2) {
                  return 'Las contraseñas no coinciden.';
                }
                return null;
              },
              decoration: InputDecoration(labelText: 'Verfique Contraseña:'),
              obscureText: true,
            ),
            /************************* */

            /*************** */
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                color: Color.fromRGBO(53, 183, 54, 50),
                onPressed: () {
                  validardatos(context);
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  } */

/* void validardatos(BuildContext context) {         
    _formKey.currentState.save();
    if (_formKey.currentState.validate()) {
      print("aceptado todo");    
      registrarUsuario(this.nombre, this.apellido, this.email, this.contrasena1);
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Procesando Datos...')));
    }
  }

  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  } */
