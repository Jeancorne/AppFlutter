import 'dart:convert';


Map data;
Map<String, String> customHeaders = {"content-type": "application/json"};
final encoding = Encoding.getByName('utf-8');
final header = {'Content-Type': 'application/json'};

void loginUsuarioController(){
  
}


/* void registrarUsuario(
    String nombre, String apellido, String email, String contrasena) async {
  var cuerpodatos = {
    "nombre": nombre,
    "apellido": apellido,
    "email": email,
    "contrasena": contrasena
  };
  String jsonBody = json.encode(cuerpodatos);
  http.Response response = await http.post(
      "http://192.168.1.59:3000/registrar_usuario",
      headers: header,
      encoding: encoding,
      body: jsonBody);
  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    print(data);
  } else {
    print('No se pudo registrar.');
  }
} */

/* void loginusuario(BuildContext context, String correo, String contrasena) async {
  var cuerpodatos = {"email": correo, "contrasena": contrasena};

  String jsonBody = json.encode(cuerpodatos);
  http.Response response = await http.post(
      "http://192.168.1.62:3000/iniciar_sesion",
      headers: header,
      encoding: encoding,
      body: jsonBody);
  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    var tok = data["token"];
    addToken(tok);
    //    addToken(tok);
    //var oelo = await obtenerPreferencias();
    print(jsonBody);
    //clsvalores clsVal = new clsvalores();
    //Navigator.pushNamed(context,"/login", arguments: clsVal, );
    //Navigator.pushReplacementNamed(context, "/login");
    //Navigator.of(context).pushReplacementNamed("/login");

    //Navigator.of(context).pushReplacementNamed("/login");
  } else {
    print('No se pudo logear.');
  }
} */
/* addToken(String token) async {
  print("Token de add token;");
  print(token);
  await FlutterSession().set("token", token);
  obtenerPreferencias();
} */
/* addToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('Token', token);
}  */
/* obtenerPreferencias() async { 
  var token = await FlutterSession().get("token");
  print("this token");
  print(token);
  return token;
 /*  SharedPreferences preferences = await SharedPreferences.getInstance();
  var token = preferences.get("token"); 
  return token; */
} */

/* getToken() async {
  final prefs = await SharedPreferences.getInstance();
  //Return String
  final stringValue =  prefs.getString('Token');
  print(stringValue);
  //return stringValue;
}
 */
