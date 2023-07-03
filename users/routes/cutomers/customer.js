const router = require('express').Router()
const { createuser,
    getalluser,
    getauser,
    updateauser ,
    deleteauser } = require('../../controllers/customers/customer')

//get all users
//create a user
router.route("/").get(getalluser).post(createuser)


//get a user
//update a user
//delete a user
router.route("/:id").get(getauser).put(updateauser).delete(deleteauser)


module.exports = router ;