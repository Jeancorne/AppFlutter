import 'dart:convert';


class clsSolicitud {
  String id_usuario;
  String cedulasolicitud;
  String nombresolicitud;
  int fijosolicitud;
  int movilsolicitud;
  String direccionsolicitud;
  int estratosolicitud;
  String emailsolicitud;
  //_________________________
  int neveracantidad;
  String neveramarca;
  //_________________________
  int airecantidad;
  String airemarca;
  //__________________________
  int calentadorcantidad;
  String calentadormarca;
  //_________________________
  int hornocantidad;
  String hornomarca;
  //_________________________
  int lavadoracantidad;
  String lavadoramarca;
  //_________________________
  clsSolicitud(
      this.id_usuario,
      this.cedulasolicitud,
      this.nombresolicitud,
      this.fijosolicitud,
      this.movilsolicitud,
      this.direccionsolicitud,
      this.estratosolicitud,
      this.emailsolicitud,
      this.neveracantidad,
      this.neveramarca,
      this.calentadorcantidad,
      this.calentadormarca,
      this.airecantidad,
      this.airemarca,
      this.hornocantidad,
      this.hornomarca,
      this.lavadoracantidad,
      this.lavadoramarca) {
    id_usuario = id_usuario;
    cedulasolicitud = cedulasolicitud;
    nombresolicitud = nombresolicitud;
    fijosolicitud = fijosolicitud;
    movilsolicitud = movilsolicitud;
    direccionsolicitud = direccionsolicitud;
    estratosolicitud = estratosolicitud;
    emailsolicitud = emailsolicitud;
    neveracantidad = neveracantidad;
    neveramarca = neveramarca;
    calentadorcantidad = calentadorcantidad;
    calentadormarca = calentadormarca;
    airecantidad = airecantidad;
    airemarca = airemarca;
    hornocantidad = hornocantidad;
    hornomarca = hornomarca;
    lavadoracantidad = lavadoracantidad;
    lavadoramarca = lavadoramarca;
  }

  void registrarsolicitud() {
    try {
      var cuerpodatos = {
        "id_usuario": this.id_usuario,
        "cedulasolicitud": this.cedulasolicitud,
        "nombresolicitud": this.nombresolicitud,
        "fijosolicitud": this.fijosolicitud,
        "movilsolicitud": this.movilsolicitud,
        "direccionsolicitud": this.direccionsolicitud,
        "estratosolicitud": this.estratosolicitud,
        "emailsolicitud": this.emailsolicitud,
        "neveracantidad": this.neveracantidad,
        "neveramarca": this.neveramarca,
        "airecantidad": this.airecantidad,
        "airemarca": this.airemarca,
        "hornocantidad": this.hornocantidad,
        "hornomarca": this.hornomarca,
        "lavadoracantidad": this.lavadoracantidad,
        "lavadoramarca": this.lavadoramarca,
      };
      String jsonBody = json.encode(cuerpodatos);
      print(jsonBody);
    } catch (e) {
      //return json(e);
    }
  }
}
