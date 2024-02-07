const express = require('express')

const app = express()
app.use(express.json())

const PORT = process.env.PORT || 3001

app.get("/", (req, res) =>{
    res.send("Hello you are home")
})


app.listen(PORT,() =>{
    console.log(`this app is listening on ${PORT}`)
})