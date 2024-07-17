

const {response} = require('express');
const Article  = require('../database/models/article');


const allArticles  = async(req, res = response)=>{
    try{
        const articles  = await Article.find();
        return res.json({success:true, articles, msg: "sucess all data"});
    }catch{
        res.status(500).json({success:true, data:clients});
    }
}

const findById = async(req, res = response)=>{
    const {id} = req.params;

    try{
        const articles  = await Article.findById(id);
        return res.json({success:true, articles, msg:"sucess data by id"});
    }catch{
        res.status(500).json({success:false, msg:'Error, please contact with Administrator'});
    }
}

const removeById = async(req, res  = response)=>{
    const {id} = req.params;

    try {
        await Article.deleteOne({_id: id});
        
        return res.json({success:true,  msg:"success remove by id"});
    } catch (error) {
        res.status(500).json({success:false, msg:'Error, please contact with Administrator'});
    }

}

module.exports  ={ allArticles, findById, removeById}