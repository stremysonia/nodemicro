const express = require('express')

const app = express();

app.use('/api/customers', (req, res) =>{
    res.send("this is the customers microservice")
})

const PORT = process.env.PORT || 3001

app.listen(PORT, console.log(`this app is listening on ${PORT}`))