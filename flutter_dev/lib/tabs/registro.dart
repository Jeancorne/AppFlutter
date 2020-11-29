import 'package:flutter/material.dart';
import 'package:flutter_dev/Controller/validaciones.dart';

class Registro extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String nombre;
  String apellido;
  String email;
  String contrasena1;
  String contrasena2;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
            padding: new EdgeInsets.all(10),
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              /////////////////////////////////////////////////////============
              TextFormField(
                decoration: new InputDecoration(
                  labelText: 'Nombre: ',
                  //contentPadding: EdgeInsets.symmetric(vertical: 10),
                ),
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                                    
                  textColor: Colors.white,
                  color: Color.fromRGBO(53, 183, 54, 50),
                  onPressed: () {
                    validardatos(context);
                  },
                  child: Text('Registro'),
                ),
              ),
            ])));
  }

   void validardatos(BuildContext context) {
    _formKey.currentState.save();
    if (_formKey.currentState.validate()) {     
     /*  registrarUsuario(
          this.nombre, this.apellido, this.email, this.contrasena1); */
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Procesando Datos...')));
    }
  }
}
