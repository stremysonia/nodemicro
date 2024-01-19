require('dotenv').config()
const passport = require("passport")
const FacebookStrategy = require('passport-facebook');
const User = require("../../models/usermodel")

passport.use(new FacebookStrategy({
    clientID: process.env.FACEBOOK_OAUTH_CLIENT_ID,
    clientSecret: process.env.FACEBOOK_OAUTH_CLIENT_SECRET,
    callbackURL: process.env.FACEBOOK_OAUTH_REDIRECT_URL,
    profileFields: ['id', 'displayName', 'photos', 'email']
  },
  function(request, accessToken, refreshToken, profile, done) {
      User.findOneAndUpdate( {
        query: { name: profile.name },
        update: { 
          $setOnInsert: { name: profile.name },
          $setOnInsert: { facebookId: profile.id }
        },
        new: true,
        upsert: true,
        remove: false
          }).then(user =>{return done(null, user);})
    }
));

passport.serializeUser(function(user, done) {
    done(null, user)
})
  
passport.deserializeUser(function(user, done) {
    done(null, user)
})