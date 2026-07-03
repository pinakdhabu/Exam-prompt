const express = require('express');
const path = require('path');
const examRoutes = require('./routes/exam');

const app = express();
const PORT = process.env.PORT || 3000;

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

app.use(express.json());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/exam', examRoutes);

app.get('/', (req, res) => {
  res.redirect('/exam');
});

app.listen(PORT, () => {
  console.log(`Exam Prompt running at http://localhost:${PORT}`);
});
