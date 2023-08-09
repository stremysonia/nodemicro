import mongoose from 'mongoose';
const UserSchema = new mongoose.Schema({
    _id:mongoose.Schema.Types.ObjectId,
    slug: String,
    name: {type:String,required:true},
    password: {type: String, required: true},
    email: {type: String, required: true},
    photo: {
        type: String,
        default: "displayphoto.jpeg"
    },
    //users can order from multiple stores so therefore have a 
    //array of stores
    orders: [
        {
            _id:mongoose.Schema.Types.ObjectId,
            amount: {type: String},
            date: {type: Date, default: Date.now()}
        }
    ],
    createdAt: {
        type: Date,
        default: Date.now
    },
})

module.exports = mongoose.model("User", UserSchema);