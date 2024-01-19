const mongoose = require('mongoose')

const userSchema = new mongoose.Schema(
  {
    name: String,
    googleId: String,
    facebookId: String,
    githubId: String,
    linkedIn_id: String
  },
  {
    timestamps: true
  }
);
const User = mongoose.model('User', userSchema);
module.exports = User;