const express = require("express");
const fs = require("fs")
const video = require("./static/")

const PORT = process.env.PORT || 3008

const app = express()
app.use(express.json())

//create route to get videos

app.route("/video", (req, res) =>{
    //path of the video
    const path = "./static/"

    //use fs to get the size of the files
    fs.stat(path, (err, stats) => {                
        if (err) {                                 
            console.error("An error occurred");
            res.sendStatus(500);
            return;
        }    
        
        //send file size to the brower
        res.writeHead(200, {                       
            "Content-Length": stats.size,
            "Content-Type": "video/mp4",
        });    
        
        //read the video
        fs.createReadStream(path).pipe(res);       
    });
})


app.listen(PORT, () =>{
    console.log(`this server is streaming videos and listening on port: ${PORT}`)
})