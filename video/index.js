const express = require("express");
const fs = require("fs")
const video = require("./static/")

const PORT = process.env.PORT;     

const app = express()
app.use(express.json())

//create route to get videos

app.route("/video", (req, res) =>{
    //path of the video
    const path = "./static/"
    fs.stat(path, (err, stats) =>{
        //if no video found
        if(err) {

        }

        res.writeHead(200, {
            "Content-length"
        })
    })
})


app.listen(PORT, () =>{
    console.log(`this server is streaming videos and listening on port: ${PORT}`)
})