import 'package:flutter/material.dart';
import 'package:flutter_dev/Clases/clsSolicitud.dart';
import 'package:flutter_dev/Clases/clsUsuario.dart';
import 'package:flutter_dev/Controller/validaciones.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class FormularioSolicitud extends StatefulWidget {
  /* clsUsuario clsus;
  //final _formKey = GlobalKey<FormState>();
  FormularioSolicitud(this.clsus) {
    clsus = clsus;
  } */

  var _marcaAire = "- Seleccione -";
  var _marcaCalentador = "- Seleccione -";
  var _marcaMicroondas = "- Seleccione -";
  var _marcaLavadora = "- Seleccione -";
  var _marcaNevera = "- Seleccione -";
  var txtcedulasolicitud;
  var txtrazonsocialnombre;
  var txttelefonofijo;
  var txtcelular;
  var txtdireccion;
  var txtestrato;
  var txtemail1;
  var txtemail2;
  int txtcantidadaireacondicionado;
  int txtcantidadcalentador;
  int txtcantidadmicroondas;
  int txtcantidadlavadora;
  int aNullableInt;
  int txtcantidadnevera;
  clsUsuario clsus;
  FormularioSolicitud(this.clsus) {
    clsus = clsus;
  }

  //FormularioSolicitud({Key key}) : super(key: key);
  @override
  _FormSolicitud createState() => _FormSolicitud();
}

class _FormSolicitud extends State<FormularioSolicitud> {
  final _formKey = GlobalKey<FormState>();
  ScrollController firstScroll = ScrollController();
  ScrollController secondScrollController = ScrollController();
  FocusNode fcedula = FocusNode();
  FocusNode frazon = FocusNode();
  FocusNode ffijo = FocusNode();
  FocusNode fmovil = FocusNode();
  FocusNode fdirec = FocusNode();
  FocusNode festrato = FocusNode();
  FocusNode femail = FocusNode();
  FocusNode fnevera = FocusNode();
  FocusNode flavadora = FocusNode();
  FocusNode fmicroondas = FocusNode();
  FocusNode fcalentador = FocusNode();
  FocusNode faire = FocusNode();
  @override
  void initState() {
    super.initState();
    firstScroll.addListener(() {
      //THIS IS called when scroll is triggered, but it might be called for other events
      secondScrollController
          .jumpTo(firstScroll.offset); // THIS will sync the scroll;
    });
  }

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
      child: cuerpo(size, context),
    ));
  }

  Widget cuerpo(size, context) {
    return new SafeArea(top: false, bottom: false, child: formi(size, context));
  }

  Widget formi(size, context) {
    return new Form(key: _formKey, child: listaelementos(size, context));
  }

  Widget listaelementos(size, context) {
    List<String> listaElementos = [
      '- Seleccione -',
      'Abba',
      'BlackAndDecker',
      'Bosch',
      'Call PHTC',
      'Centrales',
      'Cetron',
      'Challenger',
      'ConfortFresh',
      'Daewoo',
      'Daytona',
      'Electrolux',
      'Frigidaire',
      'General Electrics',
      'Goldstar',
      'Haceb',
      'IBG',
      'Icasa',
      'Inter-Ware',
      'Kalley',
      'KenMore',
      'KenWood',
      'LG',
      'Mabe',
      'Memmert',
      'Philips',
      'Quichiney',
      'Samsung',
      'Sears',
      'Shimasu',
      'Singer',
      'Sueco',
      'Supernotico',
      'Varias',
      'WestingHouse',
      'Whirlpool',
      'Wonder',
      'Wosb',
      'Ninguna de las anteriores'
    ];
    return new SingleChildScrollView(
      child: Column(children: <Widget>[
        SizedBox(height: 40),
        titulo("Datos Personales", 25),
        SizedBox(height: 25),
        new Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.all(10.0),
            elevation: 3,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: fieldcedula(),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: fieldrazonsocial(),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: fieldtelefonofijo(),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: fieldtelefonomovil(),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: fielddireccionusuario(),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: fieldestratousuario(),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: fieldemailusuario(),
                ),
                SizedBox(height: 20),
              ],
            )),
        SizedBox(height: 20),
        titulo("Equipo(s) que va a entregar: ", 23),
        SizedBox(height: 25),
        tarjetaNevera(listaElementos),
        SizedBox(height: 40),
        tarjetaAire(listaElementos),
        SizedBox(height: 40),
        tarjetaCalentador(listaElementos),
        SizedBox(height: 40),
        tarjetaMicroondas(listaElementos),
        SizedBox(height: 40),
        tarjetaLavadora(listaElementos),
        SizedBox(height: 40),
        botonProceso(),
        SizedBox(height: 40),
      ]),
    );
  }

  Card tarjetaNevera(listaElementos) {
    return new Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10.0),
        elevation: 3,
        //color: Colors.teal,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: titulo("Neveras: ", 20),
            ),
            Padding(padding: const EdgeInsets.all(12.0), child: formNevera()),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: titulo("Marca de la nevera: ", 20),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: listaNevera(listaElementos),
            ),
            SizedBox(height: 10),
          ],
        ));
  }

  Card tarjetaAire(listaElementos) {
    return new Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10.0),
        elevation: 3,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: titulo("Aire Acondicionado: ", 20),
            ),
            Padding(
                padding: const EdgeInsets.all(12.0),
                child: formAcondicionado()),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: titulo("Marca del acondicionado: ", 20),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: listaAcondicionador(listaElementos),
            ),
            SizedBox(height: 10),
          ],
        ));
  }

  Card tarjetaCalentador(listaElementos) {
    return new Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10.0),
        elevation: 3,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: titulo("Calentador: ", 20),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: formCalentador(),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: titulo("Marca del calentador: ", 20),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: listaCalentador(listaElementos),
            ),
            SizedBox(height: 10),
          ],
        ));
  }

  Card tarjetaMicroondas(listaElementos) {
    return new Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10.0),
        elevation: 3,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: titulo("Horno Microondas: ", 20),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: formHorno(),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: titulo("Marca del microondas: ", 20),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: listaHorno(listaElementos),
            ),
            SizedBox(height: 10),
          ],
        ));
  }

  Card tarjetaLavadora(listaElementos) {
    return new Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10.0),
        elevation: 3,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: titulo("Lavadora: ", 20),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: formLavadora(),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: titulo("Marca de la lavadora: ", 20),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: listaLavadora(listaElementos),
            ),
            SizedBox(height: 10),
          ],
        ));
  }

  Padding botonProceso() {
    try {
      return new Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: RaisedButton(
          textColor: Colors.white,
          color: Color.fromRGBO(53, 183, 54, 50),
          onPressed: () async {
            _formKey.currentState.save();
            if (_formKey.currentState.validate()) {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('Procesando Datos...')));
              String id_usuario = widget.clsus.id;
              clsSolicitud clsSoli = new clsSolicitud(
                id_usuario,
                widget.txtcedulasolicitud,
                widget.txtrazonsocialnombre,
                widget.txttelefonofijo,
                widget.txtcelular,
                widget.txtdireccion,
                widget.txtestrato,
                widget.txtemail1,
                //_________________________
                widget.txtcantidadnevera,
                widget._marcaNevera,
                //_________________________
                widget.txtcantidadaireacondicionado,
                widget._marcaAire,
                //_________________________
                widget.txtcantidadcalentador,
                widget._marcaCalentador,
                //_________________________
                widget.txtcantidadmicroondas,
                widget._marcaMicroondas,
                //_________________________
                widget.txtcantidadlavadora,
                widget._marcaLavadora,
              );
              clsSoli.registrarsolicitud();
            }
          },
          child: Text('Realizar Solicitud'),
        ),
      );
    } catch (e) {
      print("Error:");
      print(e);
    }
  }

  TextFormField formNevera() {
    return new TextFormField(
      focusNode: fnevera,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        icon: const Icon(Icons.description),
        hintText: 'Neveras',
        labelText: 'Cantidad de neveras.',
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        return null;
      },
      onSaved: (value) {
        if (value != "") {
          widget.txtcantidadnevera = int.parse(value);
        } else {
          widget.txtcantidadnevera = 0;
        }

        //passnueva = value;
      },
    );
  }

  TextFormField formLavadora() {
    return new TextFormField(
      focusNode: flavadora,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        icon: const Icon(Icons.description),
        hintText: 'Lavadoras',
        labelText: 'Cantidad de lavadoras.',
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        return null;
      },
      onSaved: (value) {
        if (value != "") {
          widget.txtcantidadlavadora = int.parse(value);
        } else {
          widget.txtcantidadlavadora = 0;
        }

        //passnueva = value;
      },
    );
  }

  TextFormField formHorno() {
    return new TextFormField(
      focusNode: fmicroondas,
      initialValue: null,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        icon: const Icon(Icons.description),
        hintText: 'Horno',
        labelText: 'Cantidad de hornos.',
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        return null;
      },
      onSaved: (value) {
        if (value != "") {
          widget.txtcantidadmicroondas = int.parse(value);
        } else {
          widget.txtcantidadmicroondas = 0;
        }

        //passnueva = value;
      },
    );
  }

  TextFormField formCalentador() {
    return new TextFormField(
      focusNode: fcalentador,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        icon: const Icon(Icons.description),
        hintText: 'Calentador',
        labelText: 'Cantidad de calentadores.',
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        return null;
      },
      onSaved: (value) {
        if (value != "") {
          widget.txtcantidadcalentador = int.parse(value);
        } else {
          widget.txtcantidadcalentador = 0;
        }

        //passnueva = value;
      },
    );
  }

  TextFormField formAcondicionado() {
    return new TextFormField(
      focusNode: faire,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        icon: const Icon(Icons.description),
        hintText: 'Aire Acondicionado',
        labelText: 'Cantidad de aires acondicionados.',
      ),      
      keyboardType: TextInputType.number,
      validator: (value) {
        return null;
      },
      onSaved: (value) {
        if (value != "") {
          widget.txtcantidadaireacondicionado = int.parse(value);
        } else {
          widget.txtcantidadaireacondicionado = 0;
        }
        //passnueva = value;
      },
    );
  }

  Container listaNevera(List<String> elementos) {
    try {
      return new Container(
        child: DropdownButtonFormField<String>(
          isExpanded: true,
          items: elementos.map((String dropDownStringItem) {
            return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Row(children: <Widget>[
                Icon(Icons.check),
                //SizedBox(width: 10),
                Text(dropDownStringItem),
              ]),
            );
          }).toList(),
          validator: (value) {
            /* if (widget.txtcantidadnevera != "" && value == "- Seleccione -") {
              if (widget.txtcantidadnevera > 0) {
                FocusScope.of(context).requestFocus(fnevera);
                return 'Debe elegir marca de la nevera';
              }
            } */
            return null;
          },
          onChanged: (String newvalueSelected) {
            setState(() {
              //print(newvalueSelected);
              widget._marcaNevera = newvalueSelected;
            });
          },
          value: widget._marcaNevera,
        ),
      );
    } catch (e) {
      return e;
    }
  }

  Container listaLavadora(List<String> elementos) {
    return new Container(
      child: DropdownButtonFormField<String>(
        isExpanded: true,
        items: elementos.map((String dropDownStringItem) {
          return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Row(children: <Widget>[
                Icon(Icons.check),
                Text(dropDownStringItem),
              ]));
        }).toList(),
        validator: (value) {
          if(widget.txtcantidadlavadora > 0 && value == "- Seleccione -"){
              //FocusScope.of(context).requestFocus(flavadora);
              return 'Debe elegir marca de la lavadora';
          }
          /* if (widget.txtcantidadlavadora != "" && value == "- Seleccione -") {
            if (widget.txtcantidadlavadora > 0) {
              FocusScope.of(context).requestFocus(flavadora);
              return 'Debe elegir marca de la lavadora';
            }
          } */
          return null;
        },
        onChanged: (String newvalueSelected) {
          setState(() {
            print(newvalueSelected);
            widget._marcaLavadora = newvalueSelected;
          });
        },
        value: widget._marcaLavadora,
      ),
    );
  }

  Container listaHorno(List<String> elementos) {
    try {
      return new Container(
        child: DropdownButtonFormField<String>(
          isExpanded: true,
          items: elementos.map((String dropDownStringItem) {
            return DropdownMenuItem<String>(
                value: dropDownStringItem,
                child: Row(children: <Widget>[
                  Icon(Icons.check),
                  Text(dropDownStringItem),
                ]));
          }).toList(),
          validator: (value) {
            /* if (widget.txtcantidadmicroondas != "" &&
                value == "- Seleccione -") {
              if (widget.txtcantidadmicroondas > 0) {
                FocusScope.of(context).requestFocus(fmicroondas);
                return 'Debe elegir marca del microondas';
              }
            } */
            return null;
          },
          onChanged: (String newvalueSelected) {
            setState(() {
              print(newvalueSelected);
              widget._marcaMicroondas = newvalueSelected;
            });
          },
          value: widget._marcaMicroondas,
        ),
      );
    } catch (e) {
      return e;
    }
  }

  Container listaCalentador(List<String> elementos) {
    return new Container(
      child: DropdownButtonFormField<String>(
        isExpanded: true,
        items: elementos.map((String dropDownStringItem) {
          return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Row(children: <Widget>[
                Icon(Icons.check),
                //Icon(eledat[contador]),
                //SizedBox(width: 10),
                Text(dropDownStringItem),
              ]) // Text(dropDownStringItem),
              );
        }).toList(),
        validator: (value) {
          /* if (widget.txtcantidadcalentador != "" && value == "- Seleccione -") {
            if (widget.txtcantidadcalentador > 0) {
              FocusScope.of(context).requestFocus(fcalentador);
              return 'Debe elegir marca del calentador';
            }
          } */
          return null;
        },
        onChanged: (String newvalueSelected) {
          setState(() {
            print(newvalueSelected);
            widget._marcaCalentador = newvalueSelected;
          });
        },
        value: widget._marcaCalentador,
      ),
    );
  }

  Container listaAcondicionador(List<String> elementos) {
    return new Container(
      child: DropdownButtonFormField<String>(
        isExpanded: true,
        items: elementos.map((String dropDownStringItem) {
          return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Row(children: <Widget>[
                Icon(Icons.check),
                Text(dropDownStringItem),
              ]));
        }).toList(),
        validator: (value) {
          /* if (widget.txtcantidadaireacondicionado != "" &&
              value == "- Seleccione -") {
            if (widget.txtcantidadaireacondicionado > 0) {
              FocusScope.of(context).requestFocus(faire);
              return 'Debe elegir marca del aire acondicionado';
            }
          } */
          return null;
        },
        onChanged: (String newvalueSelected) {
          setState(() {
            print(newvalueSelected);
            widget._marcaAire = newvalueSelected;
          });
        },
        value: widget._marcaAire,
      ),
    );
  }

  TextFormField fieldcedula() {
    return new TextFormField(
      focusNode: fcedula,
      textInputAction: TextInputAction.next,
      initialValue: "1017241276",
      decoration: const InputDecoration(
        icon: const Icon(Icons.perm_contact_calendar_rounded),
        hintText: 'Cédula sin puntos ni espacios',
        labelText: 'Cédula de la persona que entrega',
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value.isEmpty) {
          FocusScope.of(context).requestFocus(fcedula);
          return 'La cédula es obligatoria.';
        }
        return null;
      },
      onSaved: (value) {
        if (value == "") {
          widget.txtcedulasolicitud = null;
        } else {
          widget.txtcedulasolicitud = value;
        }
      },
      onChanged: (value) {
        return null;
      },
    );
  }

  TextFormField fieldrazonsocial() {
    return new TextFormField(
      focusNode: frazon,
      initialValue: "Mi razon social",
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        icon: const Icon(Icons.perm_contact_calendar_rounded),
        hintText: 'Razón, Social o Nombre',
        labelText: 'Nombre de la persona que entrega.',
      ),
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value.isEmpty) {
          FocusScope.of(context).requestFocus(frazon);
          return 'La razón social/Nombre es obligatorio.';
        }
        return null;
      },
      onSaved: (value) {
        widget.txtrazonsocialnombre = value;
        //passnueva = value;
      },
    );
  }

  TextFormField fieldtelefonofijo() {
    return new TextFormField(
      initialValue: "5582870",
      focusNode: ffijo,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        icon: const Icon(Icons.phone_callback),
        hintText: 'Teléfono fijo',
        labelText: 'Teléfono fijo.',
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value.isEmpty) {
          FocusScope.of(context).requestFocus(ffijo);
          return 'El teléfono fijo es obligatorio.';
        }
        return null;
      },
      onSaved: (value) {
        widget.txttelefonofijo = int.parse(value);
      },
    );
  }

  TextFormField fieldtelefonomovil() {
    return new TextFormField(
      initialValue: "3226887981",
      focusNode: fmovil,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        icon: const Icon(Icons.phone_android),
        hintText: 'Teléfono móvil / celular',
        labelText: 'Teléfono móvil / celular.',
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value.isEmpty) {
          FocusScope.of(context).requestFocus(fmovil);
          return 'El teléfono fijo es obligatorio';
        }
        return null;
      },
      onSaved: (value) {
        widget.txtcelular = int.parse(value);
        //passnueva = value;
      },
    );
  }

  TextFormField fielddireccionusuario() {
    return new TextFormField(
      focusNode: fdirec,
      initialValue: "calle 63 bc",
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        icon: const Icon(Icons.person_pin_circle_rounded),
        hintText: 'Dirección',
        labelText: 'Dirección.',
      ),
      keyboardType: TextInputType.streetAddress,
      validator: (value) {
        if (value.isEmpty) {
          FocusScope.of(context).requestFocus(fdirec);
          return 'La dirección es obligatoria';
        }
        return null;
      },
      onSaved: (value) {
        widget.txtdireccion = value;
        //passnueva = value;
      },
    );
  }

  TextFormField fieldestratousuario() {
    return new TextFormField(
      initialValue: "1",
      focusNode: festrato,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        icon: const Icon(Icons.description),
        hintText: 'Estrato',
        labelText: 'Ingrese Estrato.',
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value.isEmpty) {
          FocusScope.of(context).requestFocus(festrato);
          return 'El estrato es obligatorio';
        }
        return null;
      },
      onSaved: (value) {
        widget.txtestrato = int.parse(value);
        //passnueva = value;
      },
    );
  }

  TextFormField fieldemailusuario() {
    return new TextFormField(
      focusNode: femail,
      initialValue: "ctgi0101@gmail.com",
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        icon: const Icon(Icons.email),
        hintText: 'Email/Correo',
        labelText: 'Ingrese Email/Correo.',
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value.isEmpty) {
          FocusScope.of(context).requestFocus(femail);
          return 'El correo/email es obligatorio';
        }
        bool result = validateEmail(value);
        if (result == false) {
          return 'Correo incorrecto.';
        }
        return null;
      },
      onSaved: (value) {
        widget.txtemail1 = value;
      },
    );
  }

  Center titulo(txtitulo, double size) {
    return new Center(
      child: new Text(txtitulo, style: TextStyle(fontSize: size)),
    );
  }
}
