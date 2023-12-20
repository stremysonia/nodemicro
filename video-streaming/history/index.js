const express = require('exoress')
const mongoose = require("mongoose")


const PORT =  process.env.PORT || 4000

const app = express()
app.use(express.json())

//insert video data into database
//the video services is going to send me the path to the video
//in the request body
app.post('/viewed', (req, res) =>{
    //get the path from the json body
    const vidPath = req.body

    //add it to db or file


})

//return video data if needed
app.get("history", (req, res) =>{
    

})


app.listen(PORT, ()=>{
    console.log(`this server is listening on ${PORT}`)
})