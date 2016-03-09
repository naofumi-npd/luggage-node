var express = require('express');
var router = express.Router();
var db = require('../db');

router.get('/login', function(req, res) {
    res.render('login', {
            
    });
});

router.post('/login', function(req, res) {
    req.session.user = {name:"Matt"};
    return res.redirect('/members');
});

router.get('/logout', function(req, res) {
    if (req.session) {
        req.session.destroy();
    }
    
    return res.redirect('/');
});

module.exports = router;
