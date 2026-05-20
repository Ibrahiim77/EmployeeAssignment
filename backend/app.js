const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');

const employeeRoutes = require('./routes/EmployeeRoute');
const departmentRoutes = require('./routes/DepartmentRoute');

const app = express();

app.use(cors());
app.use(bodyParser.json());

app.use('/employees', employeeRoutes);
app.use('/departments', departmentRoutes);


module.exports = app;

