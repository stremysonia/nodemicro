const router = require('express').Router()
const User = require("../models/usermodel")

router.post('/google/signup', (req, res) =>{
    //get the access token from t
    console.log(req)
})

router.post('/facebook/signup', (req, res) =>{
    //get the access token from t
    console.log(req)
})

router.post('/signup', (req, res) =>{
    //get user info from the request body
    const { email, password } = req.body
    try{
        //save info for user
        const user = new User({ email, password})
        user.save()
        res.send(user)
    }catch(e){
        res.status(422).send(e.message)
    }
})