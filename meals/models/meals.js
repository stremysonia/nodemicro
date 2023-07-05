const mongoose = require('mongoose');

const DishSchema = new mongoose.Schema({
  dishName: {
    type: String,
    required: true,
    trim: true
  },
  price: {
    type: Number,
    required: true
  },
  image: {
    type: String
  },
  Description: {
    type: String,
    trim: true
  },
});


const Dish = mongoose.model('Dish', DishSchema);
module.exports = Dish;