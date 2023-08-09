import express from 'express'
const router = express.Router()
//const admins = require("../models/admin")


//get all users(chef or not)
router.get('/', (req, res) =>{
    res.status(200).json({success: true, msg:"this is the customers microservice"})
})


export { router as AdminRouter }