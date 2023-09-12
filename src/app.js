const express = require('express');
const path = require('path');
const morgan = require('morgan');
const mysql = require('mysql');
const myConnection = require('express-myconnection');
const { body, validationResult } = require('express-validator');

const app = express();

//importing routes
const fichasRoutes = require('./routes/fichas');
const { exists } = require('fs');

// settings
app.set('port', process.env.PORT || 3000);

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

// middlewares
app.use(morgan('dev'));
app.use(myConnection(mysql, {
    host: 'localhost',
    user: 'root',
    password: '269136fe',
    port: 3306,
    database: 'fichamedica'

}, 'single'));
app.use(express.urlencoded({ extended: true }))
app.use(express.json())


// routes
app.use('/', fichasRoutes);


//static file
app.use(express.static(path.join(__dirname, 'public')));

// starting the server
app.listen(app.get('port'), () => {
    console.log('Server on port 3000');
});

// 
app.get('/', (req, res) => {
    res.render('fichas')
})
app.post('/add', [
    body('rut', 'Ingrese un Rut con valores 000000-0 sin puntos')
        .exists()
        .isLength({ max: 10 }),
    body('nom', 'Ingrese solo nombres')
        .exists()
        .isLength({ min: 5 }),
    body('apell', 'Ingrese solo apellidos')
        .exists()
        .isLength({ min: 5 }),
    body('dir', 'Ingrese una direccion válida')
        .exists()
        .isLength({ min: 5 }),
    body('city', 'Ingrese una Ciudad')
        .exists(),
    body('phone', 'Ingrese un numero valido')
        .isAlphanumeric({ max: 11 }),
    body('email', 'Ingrese un E-mail válido')
        .exists()
        .isEmail(),
    body('date', 'Ingrese una fecha de nacimiento')
        .exists(),
    body('state', 'Ingrese una fecha de nacimiento')
        .exists(),
    body('comm', 'Ingrese una descripcion del paciente')
        .exists()
], (req, res) => {
    /*  const errors = validationResult(req);
     if (!errors.isEmpty()) {
         res.status(400).json({ errors: errors.array() });
         console.log(errors);
     } */
    const errors = validationResult(req)
    if (!errors.isEmpty()) {
        console.log(req.body)
        const valores = req.body
        const validaciones = errors.array()
        res.render('fichas', { validaciones: validaciones, valores: valores })
    } else {
        res.send('validacion exitosa!')
    }

})