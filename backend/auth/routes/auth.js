const router = require("express").Router()


router.post("/login", (req, res) =>{
    res.send('hello')
})
router.post("/register", (req, res) =>{
    res.send('hello')
})
router.post("/refresh-token", (req, res) =>{
    res.send('hello')
})
router.delete("/logout", (req, res) =>{
    res.send('hello')
})