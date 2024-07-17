const fs  = require('fs');
const path = require('path');



const dataPath = path.join(__dirname, '..','database', 'local', 'data.json');

function readData(callback) {
    fs.readFile(dataPath, 'utf8', (err, data) => {
      if (err) {
        callback(err, null);
        return;
      }
  
      try {
        const jsonData = JSON.parse(data);
        callback(null, jsonData);
      } catch (parseErr) {
        callback(parseErr, null);
      }
    });
  }

module.exports  = readData;