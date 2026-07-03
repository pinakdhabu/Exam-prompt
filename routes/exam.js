const express = require('express');
const router = express.Router();
const paper = require('../config/paper');

router.get('/', (req, res) => {
  res.render('exam', { config: paper });
});

router.get('/config', (req, res) => {
  res.json(paper);
});

module.exports = router;
