const mongoose = require('mongoose')
const { model } = require('./rolesmodel')
const { Schema } = mongoose
//const bcrypt = require('bcryptjs')

const solicitudmodel = new Schema({
    id_usuario: {
        ref: "modelUsuario",
        type: Schema.Types.ObjectId,
        required: true,       
    },
    cedulasolicitud: {
        type: Number,
        required: true,
    },
    nombresolicitud: String,
    fijosolicitud: {
        type: Number,
        required: true,      
       /*  validate: {
            validator: Number.isInteger,
            message: '{VALUE} no es un valor entero'
        } */
    },
    movilsolicitud: {
        type: Number,
        required: true,
        /* validate: {
            validator: Number.isInteger,
            message: '{VALUE} no es un valor entero'
        } */
    },
    direccionsolicitud: String,
    estratosolicitud: {
        type: Number,
        required: true,
       /*  validate: {
            validator: Number.isInteger,
            message: '{VALUE} no es un valor entero'
        } */
    },
    emailsolicitud: String,
    neveracantidad: {
        type: Number,
        required: false,
       /*  validate: {
            validator: Number.isInteger,
            message: '{VALUE} no es un valor entero'
        } */
    },
    neveramarca: String,
    airecantidad: {
        type: Number,
        required: false,
       /*  validate: {
            validator: Number.isInteger,
            message: '{VALUE} no es un valor entero'
        } */
    },
    airemarca: String,
    hornocantidad: {
        type: Number,
        required: false,       
    },
    hornomarca: String,
    lavadoracantidad: {
        type: Number,
        required: false,             
    },
    lavadoramarca: String,
})



module.exports = mongoose.model('solicitudmodel', solicitudmodel)