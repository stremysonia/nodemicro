const mongoose = require("mongoose")
const Order = require("../model/order")

exports.createOrder = async (req, res) =>{
    try{
        const newOrder = {
            userId: mongoose.Types.ObjectId(req.params.userId),
            mealIds: [req.params.meals],
            amount: req.params.amount,
            initialDate:req.params.initialDate,
            deliveryDate: req.params.deliveryDate
        }
        const order = new Order(newOrder)
        await order.save()
        res.send(200).json()
    }catch(e){
        res.status(400).json({ error: e.toString() });
    }
}


exports.getOrder = (res, req) =>{
    try{
        const order = Order.find(req.params.id)
        //chck if order exist
        if(!order){
            res.send("Invalid order")
        }else{
            fetch(`${customer}:${port}/api/user/${order.userId}`).then((response) =>{
                const orderobject = {customerName: response.data.name, mealName: ['']}
                order.meals.map((mealid) =>{
                    fetch(`${customer}:${port}/api/user/${mealid}`).then((response) =>{
                        orderobject.mealName.pop(response.data.mealName)
                        res.json(orderobject)
                    })
                })
            })
        }
    }catch(e){
        res.status(400).json({ error: e.toString() });
    }
}