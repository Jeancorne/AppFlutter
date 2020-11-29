const auth = {}
const jwt = require('jsonwebtoken');
const modelUsuario = require('../Models/usuariomodel.js');
auth.tokenverificar = async (req, res, next) => {
    try {
        const token = req.headers["x-access-token"];
        if (!token) {
            return res.status(403).json({ message: "Debe enviar el token." });
        }
        const newjwt = jwt.verify(token, "namasecrett");        
        const user = await modelUsuario.findById(newjwt.id);
        if (!user) {     
            return res.status(404).json({message:"Usuario no encontrado."});
        }
        next();
    } catch (error) {
        return res.status(404).json({message:"Token no es valido."});
    }

}



module.exports = auth;


