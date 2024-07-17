const express = require('express');
const app = express();
const port = process.env.PORT || 3000;
require('dotenv').config();
const getAndSaveData =  require('./src/helpers/saveData');
//BD config
require('./src/database/configs/config').dbConnection();

//read and save data
getAndSaveData();

//Middleware to JSON 
app.use(express.json());

app.use('/api/articles',require('./src/routes/article'));

app.listen(port, (err) => {
    if (err) throw new Error(err);
    console.error('Server is success', 3000);
});