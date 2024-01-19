const express = require('express')

const app = express()


const PORT = process.env.PORT || 4000

app.get('', (req, res) =>{
    res.send('you in!!')
})
app.get('api/user/register', (req, res) =>{
    res.send('you in!!')
})

app.listen(PORT, () =>{
    console.log(`app is listening on ${PORT}`)
})