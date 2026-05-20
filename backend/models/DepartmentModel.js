const db = require('../config/db');


exports.getAll = (callback) => {

db.query('Select * from departments', callback);

};

exports.create = (data, callback) => {

db.query('Insert into departments SET ? ', data, callback);

};

exports.update = (id, data, callback) => {

db.query('Update departments SET ? where id = ?', [data, id], callback);

};

exports.delete = (id, callback) => {

db.query('Delete from departments where id = ?', [id], callback);

};