const mongoose = require('mongoose');

const OrderSchema = new mongoose.Schema(
  {
    _id:mongoose.Schema.Types.ObjectId,
    customerId: {
      type: String,
      required: true,
    },
    meals: [
        {
            _id:mongoose.Schema.Types.ObjectId,
            mealname: {type: String},
        }
    ],
    amount: {type: String},
    initialDate: {
      type: String,
      required: true
    },
    deliveryDate: {
      type: String,
      required: true
    },
});


module.exports = mongoose.model('Order', OrderSchema);
