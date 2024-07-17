const {Schema, model}  = require('mongoose');


const ArticleSchema  = Schema({
    author:{type:String, required: true},
    title:{type:String, required: true},
    description:String,
    url:String,
    urlToImage:String,
    publishedAt: Date,
});


ArticleSchema.method('toJSON',function(){
    const {__v,_id,...object} = this.toObject();
    object.uid = _id;
    return object;
});


module.exports  =  model('Article', ArticleSchema);