require('dotenv').config()
const passport = require("passport")
const GoogleStrategy = require("passport-google-oauth20")
const User = require("../../models/usermodel")
//api version 
let version = 'v1'

passport.use(new GoogleStrategy({
    clientID: process.env.GOOGLE_OAUTH_CLIENT_ID,
    clientSecret: process.env.GOOGLE_OAUTH_CLIENT_SECRET,
    callbackURL: process.env.GOOGLE_OAUTH_REDIRECT_URL,
    passReqToCallback   : true
  },
  function(request, accessToken, refreshToken, profile, done) {
    User.findOneAndUpdate( {
      query: { name: profile.name },
  update: { 
    $setOnInsert: { name: profile.name },
    $setOnInsert: { googleId: profile.id }
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