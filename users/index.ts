//file gets read from top to bottom
import express from 'express'
//the routes
const admin = require("./routes/routes")
const chefs = require("./routes/chefs/chefroutes")
const users = require("./routes/cutomers/customer")
//mongo connection function
const connectDB = require("./config/db")

//invoking function for our db connection
connectDB()

//initializing express server
const app = express()

//it will parse the body from post/fetch request
//method inbuilt in express to recognize the incoming Request Object as a JSON Object.
app.use(express.json())

//registering our routes to our app
app.use("/api/users/admin/users", admin)
app.use("/api/users/chefs", chefs)
app.use("/api/users/customers", users)

//our port
const PORT = process.env.PORT || 3001

//our server listening to request on this port
app.listen(PORT, () =>{
    console.log(`this app is listening on ${PORT}`)
})