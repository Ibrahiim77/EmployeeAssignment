const express = require('express');
const router = express.Router();
const controller = require('../controllers/DepartmentController');

router.get('/', controller.getDepartments);
router.post('/', controller.addDepartment);
router.put('/:id', controller.updateDepartment);
router.delete('/:id', controller.deleteDepartment);

module.exports = router;