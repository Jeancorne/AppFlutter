const mongoose = require('mongoose');

mongoose.connect('mongodb://localhost:27017/dbnama',{
    useCreateIndex: true,
    useNewUrlParser: true,
    useUnifiedTopology: true,
    useFindAndModify: true,    
})
    .then (db => console.log('DB Is connected'))
    .catch(err => console.error(err));


/* //var MongoClient;
var MongoClient = require('mongodb').MongoClient;
import mongoose from 'mongoose';

async function connecta() {
    try {
        //mongoose.connect("mongodb://localhost:27017/").then(db => console.log('Db conectado')).catch()
        const cliente = await MongoClient.connect('mongodb://localhost:27017/',{useNewUrlParser: true,  useUnifiedTopology: true});
        const db = cliente.db('dbnama');
        return db;
    } catch (error) {
        console.log(error);
    }
}

//export { connect };
//exports.connect = connecta;
module.exports = {
    conn:connecta
};
 */

