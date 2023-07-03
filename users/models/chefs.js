const mongoose = require('mongoose');
const ChefSchema = new mongoose.Schema({
    _id:mongoose.Schema.Types.ObjectId,
    name: {type:String,required:true},
    password: {type: String, required: true},
    email: {type: String, required: true},
    photo: {
        type: String,
        default: "displayphoto.jpeg"
    },
    createdAt: {
        type: Date,
        default: Date.now
    },
})

module.exports = mongoose.model("Chef", ChefSchema);