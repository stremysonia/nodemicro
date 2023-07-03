const mongoose = require('mongoose');

const {MONGO_IP, MONGO_USER, MONGO_PASSWORD, MONGO_PORT} = require("./config")

const url =  `mongodb://${MONGO_USER}:${MONGO_PASSWORD}@${MONGO_IP}:${MONGO_PORT}/?authSource=admin`;

const connectDB = async () =>{
    const conn = await mongoose.connect(url, { useNewUrlParser: true, useUnifiedTopology: true})
    .then(() => {
      console.log(`Connected successfully to MongoDB`);
    })
    .catch((e) => {
      console.log('Failed to connect to MongoDB:', e);
    });
}

module.exports = connectDB;