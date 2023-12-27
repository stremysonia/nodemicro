const mongoose = require('mongoose');
require('mongoose-type-url');
const geocoder = require('../../middleware/GEOjson/index');

const StoreSchema = new mongoose.Schema(
  {
    _id:mongoose.Schema.Types.ObjectId,
    chef: {
      _id:mongoose.Schema.Types.ObjectId,
      chefname: {type:String},
    },
    storename: {
      type: String,
      required: true
    },
    description: {
      type: String,
      required: true,
      maxlength: 250,
      required: true
    },
    address: { type: String },
    location: {
      type: {
        type: String,
        enum: ['Point']
      },
      coordinates: {
        type: [Number],
        index: '2dsphere'
      },
      formattedAddress: { type: String },
      street: { type: String },
      city: { type: String },
      state: {
        type: String
      },
      zipcode: { type: Number },
      Country: { type: String }
    },
    operatingHours: {
      type: String
    },
    website: {
      type: String
    },
    mediaGallery: {
      type: String
    },
    //stores have array of meals or dishes and this is representation of it since we can call it from 
    // from a directory
    meals: [
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
      }
    ],
    socialHandle: [
      {
        Instagram: {
          type: mongoose.SchemaTypes.Url
        },
        Facebook: {
          type: mongoose.SchemaTypes.Url
        },
        Twitter: {
          type: mongoose.SchemaTypes.Url
        }
      }
    ],
    foodType: {
      type: String,
    },
    allergyInfo: {
      type: String
    }
  },
  { timestamps: true }
);

//adding GEOJson
StoreSchema.pre('save', async function (next) {
  const geoloc = await geocoder.geocode(this.address);
  this.location = {
    type: 'Point',
    coordinates: [geoloc[0].longitude, geoloc[0].latitude],
    formattedAddress: geoloc[0].formattedAddress,
    street: geoloc[0].streetName,
    city: geoloc[0].city,
    state: geoloc[0].state,
    zipcode: geoloc[0].zipcode,
    country: geoloc[0].country
  };

  this.address = undefined;
  next();
});


module.exports = mongoose.model('Store', StoreSchema);
