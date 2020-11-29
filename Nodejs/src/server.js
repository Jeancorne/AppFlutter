const express = require('express');
const app = express();
const morgan = require('morgan');
require('../src/database/conexion.js');
const rutas = require('./Routes/rutas');
//import { connect } from '../src/database/conexion.js';

class App{
    constructor() {
        this.app = express();
        this.middlewares();
        this.settings();
        this.listen();
        this.routes();
        
    }
    routes(){
        this.app.use(rutas);
    }

    settings(){       
        this.app.set('json spaces',2);
        this.app.use(express.json());
     }
     middlewares(){
        this.app.use(morgan('dev'));
    }
    listen() {
        this.app.listen(3000 || 3005);
        console.log('Server port 3000')
    }

}

new App();