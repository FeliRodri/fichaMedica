const express = require('express');
const router = express.Router();

const fichasController = require('../controllers/fichasController');

router.get('/', fichasController.list);
router.post('/add', fichasController.save);
router.get('/error', fichasController.error);
router.get('/delete/:rut', fichasController.delete);

router.get('/update/:rut', fichasController.edit);
router.post('/update/:rut', fichasController.update);

router.get('/buscador', fichasController.search);
router.post('/search',)


module.exports = router;