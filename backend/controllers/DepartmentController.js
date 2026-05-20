const department = require('../models/DepartmentModel');


exports.getDepartments = (req, res) => {

department.getAll((err, result) =>{

if(err) return res.json(err);
res.json(result);

});
};


exports.addDepartment = (req,res) => {

department.create(req.body, (err,result) => {

if(err) return res.json(err);
return res.json({message: "Department ADDEDD"});

});
};


exports.updateDepartment = (req,res) => {

department.update(req.body, (err,result) => {

if(err) return res.json(err);
return res.json({message: "Department Updated"});

});
};


exports.deleteDepartment = (req,res) => {

department.delete(req.body, (err,result) => {

if(err) return res.json(err);
return res.json({message: "Department Deleted"});

});
};