const mongoose = require('mongoose');
const AdminSchema = new mongoose.Schema({
    _id:mongoose.Schema.Types.ObjectId,
    name: {
        type:String,required:true,
        trim: true,
        maxlength: [150, "name can't be longger than 150 characters"]
    },
    slug: String,
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

module.exports = mongoose.model("Admin", AdminSchema);