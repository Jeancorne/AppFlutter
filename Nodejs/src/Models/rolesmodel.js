const mongoose = require('mongoose')
const { Schema } = mongoose


const RolModel = new Schema({
    name: String  
},
{
    versionKey: false
});

module.exports = mongoose.model('RolModel', RolModel)