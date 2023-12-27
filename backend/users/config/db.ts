import mongoose from 'mongoose';

const {MONGO_IP, MONGO_USER, MONGO_PASSWORD, MONGO_PORT} = require("./config")

const url =  `mongodb://${MONGO_USER}:${MONGO_PASSWORD}@${MONGO_IP}:${MONGO_PORT}/?authSource=admin`;

const connectDB = async () =>{
     await mongoose.connect(url).then(() => {
      console.log(`Connected successfully to MongoDB`);
    }).catch((e) => {
      console.log('Failed to connect to MongoDB:', e);
    });
}

module.exports = connectDB;