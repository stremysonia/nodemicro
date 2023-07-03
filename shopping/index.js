const express = require('express')
const mongoose = require('mongoose');
const {MONGO_IP, MONGO_USER, MONGO_PASSWORD, MONGO_PORT} = require("./config/config")

const stores = require("./routes/stores")


const app = express()

const url =  `mongodb://${MONGO_USER}:${MONGO_PASSWORD}@${MONGO_IP}:${MONGO_PORT}/?authSource=admin`;

mongoose.connect(url, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => {
    console.log('Connected successfully to MongoDB');
  })
  .catch((e) => {
    console.log('Failed to connect to MongoDB:', e);
  });

app.use("/api/stores", stores)

const port = process.env.Port || 3002


app.listen(port, () =>{
    console.log(`this app is listening on ${port}`)
})