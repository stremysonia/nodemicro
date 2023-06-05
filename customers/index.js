const express = require('express');
const mongoose =  require('mongoose');
const { MONGO_IP, MONGO_USER, MONGO_PASSWORD, MONGO_PORT } = require('./config');


const app = express();

app.use(express.json())

const reConnect = () =>{
    mongoose.connect(`monggodb://${MONGO_USER}:${MONGO_PASSWORD}@${MONGO_IP}:${MONGO_PORT}/?authSource=admin`,{
    useNewUrlParserL: true,
    useUnifiedTopology: true,
    useFindandModify: false
    }).then(() => {
        console.log("successfully connected")
    }).catch((err) => {
        console.log(err)
        setTimeout(reConnect, 5000)
    });
}

app.use('/', (req, res) =>{
    res.send("this is a test route")
});


const port = process.env.PORT || 3001;


app.listen(port, () => console.log(`app is listening on ${port}`));


