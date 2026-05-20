const express = require('express');
const router = express.Router();
const controller = require('../controllers/DepartmentController');

router.get('/', controller.getDepartments);
router.post('/', controller.addDepartment);
router.put('/', controller.updateDepartment);
router.delete('/', controller.deleteDepartment);