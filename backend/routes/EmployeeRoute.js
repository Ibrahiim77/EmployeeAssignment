const express = require('express');
const router = express.Router();
const controller = require('../controllers/EmployeeController');

router.get('/', controller.getEmployees);
router.post('/', controller.addEmployee);
router.put('/', controller.updateEmployee);
router.delete('/', controller.deleteEmployee);