const router = require("express").Router()
const { getMeals, getMeal, createMeal, updateMeal, deleteMeal } = require("../controllers/meals")

router.route("/").get(getMeals).post(createMeal)
router.route("/:id").get(getMeal).post(updateMeal).delete(deleteMeal)


module.exports = router