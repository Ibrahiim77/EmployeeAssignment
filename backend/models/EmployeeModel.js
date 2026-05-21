const db = require('../config/db');


exports.getAll = (callback) => {

db.query('Select * from employees', callback);

};

exports.create = (data, callback) => {
  const sql = 'INSERT INTO employees SET ?';

  db.query(sql, data, (err, result) => {
    if (err) {
      return callback(err, null);
    }
    return callback(null, result);
  });
};

exports.update = (id, data, callback) => {

db.query('Update employees SET ? where id = ?', [data,id], callback);

};


exports.delete= (id, callback) =>{

db.query('Delete from employees where id = ?', [id], callback);

};