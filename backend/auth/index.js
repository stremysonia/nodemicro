const express = require("express")
const mongoose = require('mongoose');
const dotenv = require('dotenv');

const connectDB = async () =>{
    await mongoose.connect(process.env.MONGODB_URL).then(() => {
    console.log(`Connected successfully to MongoDB`);
    }).catch((e) => {
    console.log('Failed to connect to MongoDB:', e);
    });
}

const app = express()
app.use(express.json())

// Set up Global configuration access
dotenv.config();
connectDB()

const PORT = process.env.PORT || 3001
app.listen(PORT, () =>{
    console.log(`app is listening on ${PORT}`)
})

app.get("/", (req, res) =>{
    res.send('home')
})

