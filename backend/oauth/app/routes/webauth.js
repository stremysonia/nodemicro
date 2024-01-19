const router = require("express").Router()
const passport = require("passport")

//-----------------------------------google------------------------------------

router.get("/google", passport.authenticate('google', {
    //info we to have permission to get of our users from google
    scope: ['profile', 'email']
}));

router.get('/google/callback',
  passport.authenticate('google', { failureRedirect: '/login', failureMessage: true }),
  function(req, res) {
    res.redirect(`/api/${process.env.VERSION}/profile`);
});

//-----------------------------------Facebook------------------------------------
router.get('/facebook', passport.authenticate('facebook'));

router.get('/facebook/callback',
  passport.authenticate('facebook', { failureRedirect: '/login' }),
  function(req, res) {
    // Successful authentication, redirect home.
    res.redirect(`/api/${process.env.VERSION}/profile`);
});

///-------------------------LOGOUT---------------------------------  
router.get('/logout', function(req, res){
    req.logout();
    res.redirect('/');
});

module.exports = router