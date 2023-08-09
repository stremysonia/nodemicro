const mongoose = require('mongoose');

const DishSchema = new mongoose.Schema(
  {
    _id:mongoose.Schema.Types.ObjectId,
    dishName: {
      type: String,
      required: true,
      trim: true
    },
    price: {
      type: Number,
      required: true
    },
    banner: {
      type: String
    },
    Description: {
      type: String,
      trim: true
    },
    store: {
      _id:mongoose.Schema.Types.ObjectId,
      storename: {type:String},
    }
});


module.exports = mongoose.model('Dish', DishSchema);
