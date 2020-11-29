const { Router } = require('express');
var { RegistrarUsuario, iniciar_sesion, getperfil,updateperfil, registrar_solicitud  } = require('../Controller/cnUsuario.js');
var auth = require('../middleware/authjwt.js');
const router = Router();

//Usuarios
router.route('/registrar_usuario').post(RegistrarUsuario);
router.route('/iniciar_sesion').post(iniciar_sesion);
router.route('/getperfil').post(auth.tokenverificar, getperfil);
router.route('/updateperfil').post(auth.tokenverificar, updateperfil);
//Solicitudes
router.route('/registrar_solicitud').post(auth.tokenverificar, registrar_solicitud);


module.exports = router;