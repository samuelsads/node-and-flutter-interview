const express  = require('express');
const app  = express();

const readData  = require('./src/helpers/readData.js');

//read file
readData((err, data)=>{

    if(err){
        console.error('Error read file', err);
        return;
    }

    console.log('Datos leídos:', data);
});


app.listen(3000, (err)=>{
    if(err) throw new Error(err);
    console.error('Server is success', 3000);
});