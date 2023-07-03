const Chef = require("../../models/chefs")

exports.createchef = async (req, res, next) =>{ 
    try{
        const chef = await Chef.create(req.body)
        res.status(201).json({ success: true, msg: 'success', data: chef})
    }catch(e){
        res.status(400).json({ success: false})
    }
}
exports.getallchef = async(req, res, next) =>{ 
    try{
        const thechefs = await Chef.find({})
        res.status(201).json({ success: true, msg: 'success', data: thechefs})
    }catch(e) {
        res.status(400).json({ success: false})
    }
}
exports.getachef = async (req, res, next) =>{ 
    try{
        const chef = await Chef.findById(req.params.id)
        res.status(200).json({ success: true, msg: 'success', data: chef})
    }catch(e) {
        res.status(400).json({ success: false}) 
    }
}
exports.updateachef = (req, res, next) =>{ res.status(200).json({ success: true, msg: 'success'})}
exports.deleteachef = (req, res, next) =>{ res.status(200).json({ success: true, msg: 'success'})}
