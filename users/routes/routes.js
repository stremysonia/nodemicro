const admins = require("../models/admin")
const router = require('express').Router()

//get all users(chef or not)
router.get('/', (req, res) =>{
    res.status(200).json({success: true, msg:"this is the customers microservice"})
})


module.exports = router ;