var express = require('express');
var router = express.Router();
var db = require('../db');

/* GET home page. */
router.get('/', function(req, res) {
    
	var query = "SELECT lt.name, lt.description, l.type, count(case when l.available = 1 then 1 else null end) as count FROM luggage l JOIN luggage_type lt ON l.type = lt.id group by l.type";
    db.query(query, function(err, rows) {
        if (err) {
            console.log("Error Selecting : %s ", err);
        }
        res.render('index', {
	        title: 'Matt\'s Luggage Service!!',
	        data: rows,
	    });
    });

    
});

module.exports = router;
