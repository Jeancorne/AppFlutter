import 'package:flutter/material.dart';
import 'package:flutter_dev/Clases/clsUsuario.dart';
import 'package:flutter_dev/Controller/validaciones.dart';

class FormPerfil extends StatefulWidget {
  clsUsuario clsus;
  final _formKey = GlobalKey<FormState>();
  FormPerfil(this.clsus) {
    clsus = clsus;
  }
  _FormPerfil createState() => _FormPerfil();
}

class _FormPerfil extends State<FormPerfil> {
  bool isEnabled = false;
  String nombre;
  String apellido;
  String email;
  String passanterior;
  String passnueva;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return new Scaffold(
        body: GestureDetector(
      onTap: () {
        final FocusScopeNode focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus && focus.hasFocus) {
          FocusManager.instance.primaryFocus.unfocus();
        }
      },
      child: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              key: widget._formKey,
              child: new ListView(
                  padding: const EdgeInsets.only(
                      top: 0,
                      left: 10.0,
                      right:
                          30.0), //const EdgeInsets.symmetric(horizontal: 16.0),
                  children: <Widget>[
                    Container(
                      height: size.height * 0.1,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: 100.0,
                            height: size.height * 0.2 - 17,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(14, 195, 232, 50),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(36),
                                  bottomRight: Radius.circular(36),
                                )),
                          )
                        ],
                      ),
                    ),
                    new TextFormField(
                      initialValue: widget.clsus.nombre != null
                          ? widget.clsus.nombre
                          : "Sin nombre.",
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.person),
                        hintText: 'Ingrese Nombre',
                        labelText: 'Nombre',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'El nombre es obligatorio.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        nombre = value;
                      },
                    ),
                    new TextFormField(
                      initialValue: widget.clsus.apellido != null
                          ? widget.clsus.apellido
                          : "Sin Apellido.",
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.person),
                        hintText: 'Ingrese apellido',
                        labelText: 'Apellido',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'El apellido es obligatorio.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        apellido = value;
                      },
                      //keyboardType: TextInputType.datetime,
                    ),
                    new TextFormField(
                      initialValue: widget.clsus.email != null
                          ? widget.clsus.email
                          : "Sin correo.",
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.email_rounded),
                        hintText: 'Ingrese correo/email',
                        labelText: 'Correo/email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'El correo es obligatorio.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        email = value;
                      },
                    ),
                    new TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.lock_rounded),
                        hintText: 'Contraseña Actual',
                        labelText: 'Contraseña Actual',
                      ),
                      obscureText: true,
                      //validator: (value) {},
                      onSaved: (value) {
                        passanterior = value;
                      },
                    ),
                    new TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.lock_rounded),
                        hintText: 'Nueva Contraseña',
                        labelText: 'Nueva Contraseña',
                      ),
                      validator: (value) {
                        if (passanterior != "" && passnueva == "") {
                          return 'La nueva contraseña es obligatorio.';
                        }
                        if (value != "" && passanterior == "") {
                          return 'Debe ingresar la contraseña actual.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        passnueva = value;
                      },
                      obscureText: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Color.fromRGBO(53, 183, 54, 50),
                        onPressed: () {
                          actualizardatos(context);
                        },
                        child: Text('Actualizar'),
                      ),
                    ),
                  ]))),
    ));
  }

  void actualizardatos(BuildContext context) async {
    widget._formKey.currentState.save();
    if (widget._formKey.currentState.validate()) {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Procesando Datos...')));
      clsUsuario clsUsnew = new clsUsuario(
          widget.clsus.token, widget.clsus.id, nombre, apellido, email);
      if (passanterior == "" && passnueva == "") {
        passanterior = null;
        passnueva = null;
      }
      clsUsuario newusuario =
          await clsUsnew.actualizarPerfil(passanterior, passnueva);
      _alertaConfirmacion();
      Navigator.pushReplacementNamed(context, "/login", arguments: newusuario);
    }
  }

  _alertaConfirmacion() async {
    await showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(seconds: 3), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            title: Text('Actualizado Correctamente...'),
          );
        });
    /* await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Confirmar Actualización'),
              content: Text('¿Quieres actualizar la información?'),
              actions: <Widget>[
                FlatButton(
                    onPressed: (){
                      Navigator.of(context).pop(true);
                      //actualizardatos(context);
                    }, // => Navigator.of(context).pop(true),
                    child: Text('SI')),
                FlatButton(
                    onPressed: (){
                      Navigator.of(context).pop(false);
                    }, // => //Navigator.of(context).pop(false),
                    child: Text('NO'))
              ],
            )); */
  }
  /* showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
       onPressed: () => Navigator.of(context).pop(true),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text("This is my message."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  } */
}
/*   return Column(      
      children: <Widget>[
        Container(
          height: size.height * 0.2,
          child: Stack(
            children: <Widget>[
              Container(
                height: size.height * 0.2 - 27,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(14, 195, 232, 50),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36),
                  )
                ),
              )
            ],
          ),
        )        
      ],    
    ); */

/* return Form(
      key: widget._formKey,
      child: SingleChildScrollView(
          padding: new EdgeInsets.all(10),
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            TextFormField(
              //enabled: enableButton(),
              initialValue: widget.clsus.nombre,
              decoration: new InputDecoration(
                labelText: 'Nombre: ',
              ),
              validator: (value) {
                /* _enableBtn = true;
                if (value.isEmpty) {
                  return 'El nombre es obligatorio.';
                }
                return null; */
              },
              onChanged: (val) {
                //_enableBtn = true;
              },
              onSaved: (value) {
                //this.nombre = value;
              },
            ),
            TextFormField(
              initialValue: widget.clsus.apellido,
              decoration: InputDecoration(labelText: 'Apellido: '),
              validator: (value) {
                if (value.isEmpty) {
                  return 'El apellido es obligatorio.';
                }
                return null;
              },
              onSaved: (value) {
                //this.apellido = value;
              },
            ),
            TextFormField(
              initialValue: widget.clsus.email,
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
                //this.email = value;
              },
            ),
            TextFormField(
              onSaved: (value) {
                //this.contrasena1 = value;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'La contraseña es obligatoria.';
                }
                return null;
              },
              decoration: InputDecoration(labelText: 'Contraseña Actual:'),
              obscureText: true,
            ),
            TextFormField(
              onSaved: (value) {
                //this.contrasena2 = value;
              },
              validator: (value) {
                /*  if (this.contrasena1 != this.contrasena2) {
                    return 'Las contraseñas no coinciden.';
                  }
                  return null; */
              },
              decoration: InputDecoration(labelText: 'Nueva Contraseña:'),
              obscureText: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                textColor: Colors.white,
                color: Color.fromRGBO(53, 183, 54, 50),
                onPressed: () {
                  //isEnabled = false;
                  //enableButton();
                  // validardatos(context);
                },
                child: Text('Actualizar'),
              ),
            ),
          ])),
    ); */

/* class FormPerfil extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  clsUsuario clsus;
  FormPerfil(this.clsus) {
    clsus = clsus;
  }


  bool _enableBtn = true;
  @override
  Widget build(BuildContext context) {
    return Form(        
        key: _formKey,
        child: SingleChildScrollView(
            padding: new EdgeInsets.all(10),
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              /////////////////////////////////////////////////////============
              TextFormField(                
                enabled: _enableBtn,
                initialValue: clsus.nombre,
                decoration: new InputDecoration(
                  labelText: 'Nombre: ',
                ),                
                validator: (value) {
                   _enableBtn = true;
                  if (value.isEmpty) {
                    return 'El nombre es obligatorio.';
                  }
                  return null;
                },                
                onChanged: (val){
                  _enableBtn = true;
                },
                onSaved: (value) {
                  //this.nombre = value;
                },
              ),
              TextFormField(
                initialValue: clsus.apellido,
                decoration: InputDecoration(labelText: 'Apellido: '),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'El apellido es obligatorio.';
                  }
                  return null;
                },
                onSaved: (value) {
                  //this.apellido = value;
                },
              ),
              TextFormField(
                initialValue: clsus.email,
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
                  //this.email = value;
                },
              ),
              TextFormField(
                onSaved: (value) {
                  //this.contrasena1 = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'La contraseña es obligatoria.';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'Actualizar Contraseña:'),
                obscureText: true,
              ),
              TextFormField(
                onSaved: (value) {
                  //this.contrasena2 = value;
                },
                validator: (value) {
                  /*  if (this.contrasena1 != this.contrasena2) {
                    return 'Las contraseñas no coinciden.';
                  }
                  return null; */
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
                    
                    // validardatos(context);
                  },
                  child: Text('Actualizar'),
                ),
              ),
            ])));
  }
}
 */
