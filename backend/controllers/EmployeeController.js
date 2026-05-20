const employee = require('../models/EmployeeModel');


exports.getEmployees = (req, res) => {

employee.getAll((err,result) => {

if(err) return res.json(err);
res.json(result);
});
};

exports.addEmployee = (req, res) => {

employee.create(req.body, (err,result) =>{

if(err) return res.json(err);
return res.json({message: "Employee added"});
});
};


exports.updateEmployee = (req, res) => {

employee.update(req.body, (err, result) => {

if(err) return res.json(err);
return res.json({message: "UPDATED EMPLOYEE"});
});
};


exports.deleteEmployee = (req, res) => {

employee.delete(req.body, (err,result) => {

if(err) return res.json(err);
return res.json({message: "EMPLOYEE DELETED"});
});
};

