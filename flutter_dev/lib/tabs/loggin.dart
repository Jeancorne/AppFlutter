import 'package:flutter/material.dart';
import 'package:flutter_dev/Clases/clsUsuario.dart';
import 'package:flutter_dev/Controller/validaciones.dart';
import 'package:flutter_dev/tabs/registro.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _key = GlobalKey<FormState>();
  bool _obscureText = true;
  String contrasena;
  String correo;

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();
    return new Scaffold(        
        body: new Center(
            child: new SingleChildScrollView(
                child: new Container(
                    //margin: new EdgeInsets.all(20.0),
                    child: Center(
                        child: new Form(
      key: _key,
      //autovalidate:
      child: _getFormUI(),
    ))))));
  }

  Widget _getFormUI() {
    return new Column(children: <Widget>[
      new Image.asset(
        'assets/imagenes/UserLogo.png',
        height: 100,
        width: 100,
      ),
      Divider(
        //color: Colors.black,
        height: 36,
      ),
      new Text("Iniciar Sesión", style: TextStyle(fontSize: 20)),
      new SizedBox(height: 50.0),
      new TextFormField(
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Correo',
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
        initialValue: "car@gmail.com",
        onSaved: (value) {
          correo = value;
        },
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
      ),
      new SizedBox(height: 20.0),
      new TextFormField(
        autofocus: false,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Contraseña',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              semanticLabel: _obscureText ? 'Mostras contraseña' : 'Ocultar Contraseña',
            ),
          ),
        ),
        obscureText: true,
        initialValue: "123333",
        onSaved: (value) {
          contrasena = value;
        },
      ),
      new SizedBox(height: 15.0),
      new Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          onPressed:(){
            registrocontroller(context);
          } ,
          padding: EdgeInsets.all(12),
          color: Colors.lightBlueAccent,
          child: Text('Iniciar Sesión', style: TextStyle(color: Colors.white)),
        ),
      ),
      new FlatButton(
        child: Text(
          'Olvido Contraseña?',
          style: TextStyle(color: Colors.black54),
        ),
        onPressed: () {
          
        },
      ),
      new FlatButton(
        onPressed: _navegarRegistro,
        child: Text('No tienes cuenta? Crea una ahora',
            style: TextStyle(color: Colors.black54)),
      )
    ]);
  }
  _navegarRegistro() {
    Navigator.pushReplacementNamed(context, "/", arguments: 2);
  }

  registrocontroller(BuildContext context) async {
    _key.currentState.save();
    if (_key.currentState.validate()) {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Procesando Datos...')));

      clsUsuario clsUs = new clsUsuario(null, null, null, null, correo);
      var datausuario = await clsUs.loginusuario(context, contrasena);
      clsUsuario perfilusuario = await clsUs.getperfil(
          datausuario["token"]["IdUsuario"], datausuario["token"]["token"]);
      Navigator.pushReplacementNamed(context, "/login",
          arguments: perfilusuario);
    }
  }
}

/* class Loggin extends StatelessWidget {
  String correoo;
  String contrasenaa;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Container(
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.7,
                        decoration: BoxDecoration(
                            image: new DecorationImage(
                                image: AssetImage("assets/imagenes/hojas.png"),
                                fit: BoxFit.fill,
                                colorFilter: ColorFilter.mode(
                                    Colors.white.withOpacity(0.2),
                                    BlendMode.dstATop)))),
                  ),
                  Positioned(
                      child: Center(
                    child: Text(
                      "Inicio Sesión",
                      style: TextStyle(color: Colors.black, fontSize: 35),
                    ),
                  )),
                  Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 50.0),
                          //padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            initialValue: "car@gmail.com",
                            onSaved: (value) {
                              this.correoo = value;
                            },
                            decoration:
                                InputDecoration(labelText: 'Correo/Email: '),
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
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 130.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            initialValue: "123333",
                            onSaved: (value) {
                              this.contrasenaa = value;
                            },
                            obscureText: true,
                            decoration:
                                InputDecoration(labelText: 'Contraseña: '),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'La contraseña es obligatoria.';
                              }
                              return null;
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(30.0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 220.0),
                          child: Center(
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: Color.fromRGBO(53, 183, 54, 50),
                              onPressed: () {
                                _formKey.currentState.save();
                                registrocontroller(context);
                              },
                              child: Text('Iniciar Sesión'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  void registrocontroller(BuildContext context) async {
    _formKey.currentState.save();
    if (_formKey.currentState.validate()) {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Procesando Datos...')));
      clsUsuario clsUs = new clsUsuario(null, null, null, null, this.correoo);
      var datausuario = await clsUs.loginusuario(context, contrasenaa);
      /* var idusuario =  datausuario["token"]["IdUsuario"];
      var numtoken = datausuario["token"]["token"]; */
      clsUsuario perfilusuario = await clsUs.getperfil(
          datausuario["token"]["IdUsuario"], datausuario["token"]["token"]);
      Navigator.pushReplacementNamed(context, "/login",
          arguments: perfilusuario);
      //Navigator.pushNamed(context,"/login", arguments: perfilusuario);
      /* loginusuario(
        context,
        this.correoo,
        this.contrasenaa,
      ); */
    }
  }
} */
/*  Widget build(BuildContext context) {
    final _formKey = new GlobalKey<FormState>();

    
    return Scaffold(      
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
              child: Stack(children: [
            Positioned(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: BoxDecoration(
                      image: new DecorationImage(
                          image: AssetImage("assets/imagenes/hojas.png"),
                          fit: BoxFit.fill,
                          colorFilter: ColorFilter.mode(
                              Colors.white.withOpacity(0.2),
                              BlendMode.dstATop)))),
            ),
            Positioned(
                child: Center(
              child: Text(
                "Inicio Sesión",
                style: TextStyle(color: Colors.black, fontSize: 35),
              ),
            )),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 50.0),
                    //padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: TextFormField(                      
                      initialValue: "car@gmail.com",
                      onSaved: (value) {
                        this.correoo = value;
                      },
                      decoration: InputDecoration(labelText: 'Correo/Email: '),
                       validator: (value) {
                        /* bool result = validateEmail(value);
                        if (result == false) {
                          return 'Correo incorrecto.';
                        } */
                        if (value.isEmpty) {
                          return 'El correo es obligatorio.';
                        }
                        return null;
                      }, 
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 130.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: TextFormField(
                       initialValue: "123333",
                      onSaved: (value) {
                        this.contrasenaa = value;
                      },
                      decoration: InputDecoration(labelText: 'Contraseña: '),
                      /*  validator: (value) {
                        if (value.isEmpty) {
                          return 'La contraseña es obligatoria.';
                        }
                        return null;
                      }, */
                    ),
                  )
                ],
              ),
            ), 
            Padding(
              padding: EdgeInsets.all(30.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 220.0),
                    child: Center(
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Color.fromRGBO(53, 183, 54, 50),
                        onPressed: () {
                          _formKey.currentState.save();
                          print(this.correoo);
                          //clsregistro(context);
                        },
                        child: Text('Iniciar Sesión'),
                      ),
                    ),
                  )
                ],
              ),
            ),
             Padding(
              padding: EdgeInsets.all(30.0),
              child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 300.0),
                      child: Center(
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Color.fromRGBO(53, 183, 54, 50),
                          onPressed: () {
                            //validardatos(context);
                          },
                          child: Text('¿Olvido Contraseña?'),
                        ),
                      ),
                    )
                  ]),
            ), 
          ]))
        ]),
      ),
    );
  } */
