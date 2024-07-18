/**
 * api/article
 */



const {Router, response}  = require('express');
const { allArticles, findById, removeById } = require('../controllers/article');
const router  = Router();



router.get('/', allArticles);

router.get('/:id', findById);

router.delete('/:id', removeById);


module.exports  = router;