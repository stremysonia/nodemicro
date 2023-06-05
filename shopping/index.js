const express = require('express')
const cors = require('cors')

const app = express()
app.use(cors())
app.use(express.json())

app.get("/", (req, res, next =>{
    res.send("this is the shopping microservice")
}))

const port = process.env.PORT || 3003;


app.listen(port, () => console.log(`app is listening on ${port}`));
