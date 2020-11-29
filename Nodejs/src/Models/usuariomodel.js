const mongoose = require('mongoose')
const { model } = require('./rolesmodel')
const { Schema } = mongoose
const bcrypt = require('bcryptjs')

const modelUsuario = new Schema({
    nombre_usuario: String,
    apellido: String,
    email: {
        type: String,
        unique: true
    },
    contrasena: {
        type: String,
        required: true
    },
    roles: [{
        ref: "RolModel",
        type: Schema.Types.ObjectId
    }]
}, {
    timestamps: true,
    versionKey: false
})


modelUsuario.statics.encryptarcontrasena = async (contrasena) => {
    const salt = await bcrypt.genSalt(10);
    const hash = bcrypt.hash(contrasena, salt);
    return await hash;
}

modelUsuario.statics.compararcontrasena = async (password, passwordbd) => {
    return await bcrypt.compare(password, passwordbd);

}


module.exports = mongoose.model('modelUsuario', modelUsuario)

