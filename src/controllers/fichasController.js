const controller = {};

controller.list = (req, res) => {
    req.getConnection((err, conn) => {
        conn.query('SELECT * FROM fichas', (err, fichas) => {
            if (err) {
                res.json(err);
            }
            res.render('fichas', {
                data: fichas
            });

        });
    });
};

/* controller.save = (req, res) => {
    console.log(req.body);
    res.send('works')
}
 */
controller.save = (req, res) => {
    const datos = req.body;

    let rutid = datos.rut;
    let nombre = datos.nom;
    let apellido = datos.apell;
    let direccion = datos.dir;
    let ciudad = datos.city;
    let telefono = datos.phone;
    let email = datos.email;
    let fechaNac = datos.birth;
    let estCiv = datos.state;
    let comentarios = datos.comm;

    let buscar = "SELECT * FROM fichas WHERE rut = '" + rutid + "'";

    req.getConnection((err, conn) => {

        conn.query(buscar, function (error, row) {
            if (error) {
                throw error;
            } else {
                if (row.length > 0) {
                    console.log("No se puede registrar, usuario ya existe");
                    res.redirect('/error')
                } else {

                    let ingresar = "INSERT INTO fichas (rut, nombres, apellidos, direccion, ciudad, telefono, email, fechaNacimiento, estadoCivil, comentarios) VALUES ('" + rutid + "','" + nombre + "','" + apellido + "','" + direccion + "','" + ciudad + "','" + telefono + "','" + email + "','" + fechaNac + "','" + estCiv + "','" + comentarios + "')";

                    conn.query(ingresar, function (error) {
                        if (error) {
                            throw error;
                        } else {
                            console.log("Datos almacenados correctamente");
                            res.redirect('/');
                        }
                    });

                }
            }
        });

    });



    /*  req.getConnection((err, conn) => {
         conn.query('INSERT INTO fichas set ?', [data], (err, rows) => {
             console.log(rows);
             res.send('funciona')
         });
     }); */

};

controller.search = (req, res) => {
    const { apellidos } = req.params;

    req.getConnection((err, conn) => {
        conn.query('SELECT * FROM fichas WHERE apellidos LIKE ?', [`%${apellidos}%`], (err, fichas) => {
            if (err) {
                console.error('Error de consulta:', err);
                res.status(500).send('Error en la búsqueda');
                return;
            }
            res.render('buscador', { resultados: fichas });
        });
    });

};



controller.edit = (req, res) => {
    const { rut } = req.params;

    req.getConnection((err, conn) => {
        conn.query('SELECT * FROM fichas WHERE rut = ?', [rut], (err, fichas) => {
            res.render('fichas_edit', {
                data: fichas[0]
            });
        });
    });
};

controller.delete = (req, res) => {
    const { rut } = req.params;

    req.getConnection((err, conn) => {
        conn.query('DELETE FROM fichas WHERE rut = ?', [rut], (err, rows) => {
            console.log(rut);
            res.redirect('/');
        });
    })
};


controller.update = (req, res) => {
    const { rut } = req.params;
    const newFicha = req.body;

    req.getConnection((err, conn) => {
        if (err) {
            console.error(err);
            return res.redirect('/error');
        }
        conn.query('UPDATE fichas set ? WHERE rut = ?', [newFicha, rut], (err, rows) => {
            if (err) {
                console.error(err);
                return res.redirect('/error');
            }

            res.redirect('/');
        });
    });
};

controller.error = (req, res) => {

    const error = new Error('El usuario ya existe, por favor intente con otro Rut. ');
    error.status = 500;

    res.render('error', { error });
};



module.exports = controller;