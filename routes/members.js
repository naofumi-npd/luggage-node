var express = require('express');
var router = express.Router();
var auth = require('../middlewares/authentication');


router.get('/members', auth, function(req, res) {
    res.render('member', {
     });
    
});
module.exports = router;

