

const readData = require('./readData');

const Article = require('../database/models/article');


const saveDataToMongo = async () => {
    try {
        readData(async (err, data) => {
            if (err) {
                console.error('Error to read file', err);
                return;
            }
            
            const dbArticles = await Article.find({});
            

            if (dbArticles.length != data.length) {

                if(dbArticles.length == 0){
                    await Article.insertMany(data);
                    console.log("All data save", data);  
                }else{
                    for (const article of data) {
                    const existingArticle = await Article.findOne({ title: article.title });

                    if (!existingArticle) {
                        await Article.create(article);
                        console.log(`save article: ${article.title}`);
                    }
                }
                }
            }
        });
    } catch (err) {
        console.error('Error to save data', err);
    }
}


module.exports = saveDataToMongo;