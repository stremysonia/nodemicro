const router = require('express').Router()
const {  createchef,
    getallchef,
    getachef,
    updateachef ,
    deleteachef } = require('../../controllers/chefs/chefs')

//get all chefs
//create a chef
router.route("/").get(getallchef).post(createchef)


//get a chef
//update a chef
//delete a chef
router.route("/:id").get(getachef).put(updateachef).delete(deleteachef)


module.exports = router ;