const Store = require("../models/stores")

exports.getStores = async (req, res) =>{
    try{
        const stores = await Store.find({})
        res.status(201).json(store);
    }catch(e) {
        res.status(400).json({ error: e.toString() })
    }
}
exports.getStore = async (req, res) =>{
    try{
        const chef = await Store.findById(req.params.id)
        res.status(200).json({ success: true, msg: 'success', data: chef})
    }catch(e) {
        res.status(400).json({ error: e.toString() });
    }
} 
exports.createStore = async (req, res) =>{
    try{
        const newStore = {
            storename: req.body.storename,
            chefname: req.body.chefname,
            description: req.body.description,
            address: req.body.address,
        }
        const store = new Store(newStore)
        await store.save
        res.status(201).json(store);
    }catch(e) {
        res.status(400).json({ error: e.toString() });
    }
} 
exports.updateStore = (req, res, next) =>{
    try{

    }catch(e) {

    }
} 
exports.deleteStore = async(req, res, next) =>{
    try{
        const stores = await Store.findByIdAndRemove(req.params.id)
        res.status(201).json({ msg: "store deleted"});
    }catch(e) {
        res.status(400).json({ error: e.toString() })
    }
}

exports.addProduct = async(req, res) =>{
    //i want to get a list of products from this store
    
    const chef = await Store.findById(req.params.id)
}