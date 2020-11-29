var bcrypt = require('bcrypt');
const modelUsuario = require('../Models/usuariomodel.js');
const RolModel = require('../Models/rolesmodel.js');
const solicitudmodel = require('../Models/solicitudmodel');
const jwt = require('jsonwebtoken');
var ObjectID = require('mongodb').ObjectID;
async function RegistrarUsuario(req, res) {
   try {
      var idrol;
      if (req.body.roles) {
         const role = await RolModel.find({ name: { $in: req.body.roles } });
         idrol = role.map(role => role._id);
      }
      var nombre = req.body.nombre;
      var apellido = req.body.apellido;
      var emailusuario = req.body.email;
      var contrasena = await modelUsuario.encryptarcontrasena(req.body.contrasena);
      const newUs = new modelUsuario({
         nombre_usuario: nombre,
         apellido: apellido,
         email: emailusuario,
         contrasena: contrasena,
         roles: idrol
      })
      var usuariosaved = await newUs.save();
      var idusuario = usuariosaved._id;
      const token = jwt.sign({ id: idusuario }, "namasecrett", {
         expiresIn: 80000
      })
      res.status(200).json({ token });


   } catch (error) {
      res.json(error);
   }
}

async function iniciar_sesion(req, res) {
   try {
      const userencontrado = await modelUsuario.findOne({ email: req.body.email }).populate("roles");
      if (!userencontrado) {
         return res.status(400).json({ message: "Correo no existe" });
      }
      var matchcontra = await modelUsuario.compararcontrasena(req.body.contrasena, userencontrado.contrasena);
      if (!matchcontra) return res.status(401).json({ token: null, "errorusuario": "Contraseña o correo incorrecto." });

      const token = jwt.sign({ id: userencontrado._id }, "namasecrett", {
         expiresIn: 80000
      });
      const datosusuario = {
         "IdUsuario": userencontrado._id,
         "token": token
      };
      res.json({ token: datosusuario });
   } catch (error) {
      res.json(error);
   }
}



async function getperfil(req, res) {
   try {
      var idus = req.body.userid;
      const userperfil = await modelUsuario.findOne({}, { _id: idus, nombre_usuario: 1, apellido: 1, email: 1 }).populate("roles");
      if (!userperfil) {
         return res.status(404).json({ message: "Usuario no encontrado." });
      }
      res.json({ "dbUsuario": userperfil });
   } catch (error) {
      res.json({ "Usuario no encontrado": error });
   }
}

async function updateperfil(req, res) {
   try {
      if (req.body.passwordold != null && req.body.passwordnueva != null) {
         const userencontrado = await modelUsuario.findById({ _id: req.body.idusuario });
         var matchcontra = await modelUsuario.compararcontrasena(req.body.passwordold, userencontrado.contrasena);
         if (!matchcontra) return res.status(401).json({ token: req.headers["x-access-token"], "errorcontrasena": "La contraseña actual no es correcta." });
         var contrasena = await modelUsuario.encryptarcontrasena(req.body.passwordnueva);
         const updatecontra = await modelUsuario.updateOne({ "_id": ObjectID(req.body.idusuario) },
            {
               $set: {
                  "contrasena": contrasena
               }
            });
      }
      const update = await modelUsuario.updateOne({ "_id": ObjectID(req.body.idusuario) },
         {
            $set: {
               "nombre_usuario": req.body.nombre,
               "apellido": req.body.apellido,
               "email": req.body.email
            }
         });
      if (!update) return res.status(401).json({ token: req.headers["x-access-token"], "Error": "No se pudo actualizar, compruebe datos." });
      const userperfil = await modelUsuario.findOne({}, { _id: req.body.idusuario, nombre_usuario: 1, apellido: 1, email: 1 }).populate("roles");

      return res.status(200).json({ token: req.headers["x-access-token"], "dbUsuario": userperfil, "Correcto": "Los datos se actualizaron correctamente." });
   } catch (error) {
      console.log(error);
      res.json({ "Error": error });
   }
}

async function registrar_solicitud(req, res) {
   try {
      var { id_usuario,    cedulasolicitud,   razonsocialsolicitud, fijosolicitud, movilsolicitud,
            direccionsolicitud,  estratosolicitud, emailsolicitud,  neveracantidad,  neveramarca,
            airecantidad, airemarca,  hornocantidad,  hornomarca, lavadoracantidad, lavadoramarca } = req.body
       const newPeticion = new solicitudmodel({
         id_usuario: id_usuario,
         cedulasolicitud:cedulasolicitud,
         razonsocialsolicitud: razonsocialsolicitud,
         fijosolicitud:fijosolicitud,
         movilsolicitud:movilsolicitud,
         direccionsolicitud:direccionsolicitud,
         estratosolicitud:estratosolicitud,
         emailsolicitud:emailsolicitud,
         neveracantidad:neveracantidad,
         neveramarca:neveramarca,
         airecantidad:airecantidad,
         airemarca:airemarca,
         hornocantidad:hornocantidad,
         hornomarca:hornomarca,
         lavadoracantidad:lavadoracantidad,
         lavadoramarca:lavadoramarca 
       });

       const dato = newPeticion.save();
       res.json(dato);
       



      //return null;
   } catch (error) {
      res.json(error);
   }
}


module.exports = {
   RegistrarUsuario,
   iniciar_sesion,
   getperfil,
   updateperfil,
   registrar_solicitud
};
