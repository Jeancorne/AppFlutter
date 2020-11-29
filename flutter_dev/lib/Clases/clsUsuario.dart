import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class clsUsuario {
  String token;
  String id;
  String nombre;
  String apellido;
  String email;
  String contrasena;
  final header = {'Content-Type': 'application/json'};
  final url = "http://192.168.1.59:3000/"; //; /registrar_usuario";
  final encoding = Encoding.getByName('utf-8');
  clsUsuario(this.token, this.id, this.nombre, this.apellido, this.email) {
    token = token;
    nombre = nombre;
    apellido = apellido;
    email = email;
  }
  void registrarUsuario(
      String nombre, String apellido, String email, String contrasena) async {
    var cuerpodatos = {
      "nombre": nombre,
      "apellido": apellido,
      "email": email,
      "contrasena": contrasena
    };
    String jsonBody = json.encode(cuerpodatos);
    http.Response response = await http.post(url + "registrar_usuario",
        headers: header, encoding: encoding, body: jsonBody);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(data);
    } else {
      print('No se pudo registrar.');
    }
  }

  loginusuario(BuildContext context, String contra) async {
    var cuerpodatos = {"email": this.email, "contrasena": contra};
    String jsonBody = json.encode(cuerpodatos);
    http.Response response = await http.post(url + "iniciar_sesion",
        headers: header, encoding: encoding, body: jsonBody);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data;
    } else {
      print('No se pudo logear.');
    }
  }

  // ignore: missing_return
  Future<clsUsuario> getperfil(String idUsuario, String token) async {
    var head = {'Content-Type': 'application/json', 'x-access-token': token};
    var cuerpodatos = {"userid": idUsuario};
    String jsonBody = json.encode(cuerpodatos);
    http.Response response = await http.post(url + "getperfil",
        headers: head, encoding: encoding, body: jsonBody);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      clsUsuario clsUsperfil = new clsUsuario(
          token,
          data["dbUsuario"]["_id"],
          data["dbUsuario"]["nombre_usuario"],
          data["dbUsuario"]["apellido"],
          data["dbUsuario"]["email"]);
      return clsUsperfil;
    } else {
      print('No se pudo obtener perfil.');
    }
  }

 // ignore: missing_return
Future<clsUsuario> actualizarPerfil(String passanterior, String passnueva) async {
    var head = {'Content-Type': 'application/json', 'x-access-token': token};
    var cuerpodatos = {
      "idusuario": id,
      "nombre": this.nombre,
      "apellido": this.apellido,
      "email": this.email,
      "passwordold": passanterior,
      "passwordnueva": passnueva
    };
    String jsonBody = json.encode(cuerpodatos);
    http.Response response = await http.post(url + "updateperfil",
        headers: head, encoding: encoding, body: jsonBody);
    if (response.statusCode == 200) {
       var data = json.decode(response.body);
       clsUsuario clsUsperfil = new clsUsuario(
          data["token"],
          data["dbUsuario"]["_id"],
          data["dbUsuario"]["nombre_usuario"],
          data["dbUsuario"]["apellido"],
          data["dbUsuario"]["email"]);
      return clsUsperfil;
    }
    print(cuerpodatos);
  }

  /*  addToken(String token) async {
    print("Token de add token;");
    print(token);
    await FlutterSession().set("token", token);
    //obtenerPreferencias();
  }

  obtenerPreferencias() async {
    var token = await FlutterSession().get("token");
    print("this token");
    print(token);
    return token;
  } */
}
