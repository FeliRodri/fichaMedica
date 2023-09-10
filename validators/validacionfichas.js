const { check } = require('express-validator')
const { validateResult } = require('helpers/validateHelper')

const validateCreate = [
    check('rut')
        .exists()
        .not()
        .isEmpty(),
    check('nombres')
        .exists()
        .not()
        .isEmpty()
]

module.exports = { validateCreate }