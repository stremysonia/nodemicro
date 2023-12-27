import mongoose from 'mongoose';
const ChefSchema = new mongoose.Schema({
    _id:mongoose.Schema.Types.ObjectId,
    slug: String,
    name: {type:String,required:true},
    password: {type: String, required: true},
    email: {type: String, required: true},
    photo: {
        type: String,
        default: "displayphoto.jpeg"
    },
    //each chef only has one store
    store: {
        _id:mongoose.Schema.Types.ObjectId,
        name: {type:String},
        description: {type:String},
        banner: {type: String}
    },
    createdAt: {
        type: Date,
        default: Date.now
    },
})

module.exports = mongoose.model("Chef", ChefSchema);