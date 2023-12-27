import { Request, Response } from 'express'
//import { body } from'express-validator'
const Chef = require("../../models/chefs")

exports.createchef = async (req: Request, res: Response) =>{ 
    try{
        const chef = await Chef.create(req.body)
        res.status(201).json({ success: true, msg: 'success', data: chef})
    }catch(e){
        res.status(400).json({ success: false})
    }
}
exports.getallchef = async(req: Request, res: Response) =>{ 
    try{
        const thechefs = await Chef.find({})
        res.status(201).json({ success: true, msg: 'success', data: thechefs})
    }catch(e) {
        res.status(400).json({ success: false})
    }
}
exports.getachef = async (req: Request, res: Response) =>{ 
    try{
        const chef = await Chef.findById(req.params.id).populate('store')
        res.status(200).json({ success: true, msg: 'success', data: chef})
    }catch(e) {
        res.status(400).json({ success: false}) 
    }
}
exports.updateachef = (req: Request, res: Response) =>{ res.status(200).json({ success: true, msg: 'success'})}
exports.deleteachef = (req: Request, res: Response) =>{ res.status(200).json({ success: true, msg: 'success'})}

