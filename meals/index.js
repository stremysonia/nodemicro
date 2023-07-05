const express = require("express")
const meals = require("./routes/meals")

const app = express()
app.use(express.json())

const PORT = process.env.PORT || 3003

app.use("/api/stores", meals)

app.listen(PORT, () =>{
    console.log(`this app is listening on ${PORT}`)
})