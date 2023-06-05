const express = require('express')
const cors = require('cors')

const app = express()
app.use(cors())
app.use(express.json())
app.get("/", (req, res, next =>{
    res.send("this is the product microservice")
}))

const port = process.env.PORT || 3002;


app.listen(port, () => console.log(`app is listening on ${port}`));


