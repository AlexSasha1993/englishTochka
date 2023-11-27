const express = require('express');
const mysql = require('./mysql.sql'); // Библиотека для взаимодействия с MySQL
const app = express();
const port = 3000;

// Подключение к базе данных
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'ваш_пользователь',
  password: 'ваш_пароль',
  database: 'english_test',
});

connection.connect((err) => {
  if (err) {
    console.error('Ошибка подключения к базе данных:', err);
  } else {
    console.log('Подключено к базе данных');
  }
});

// Обработка запроса для получения данных из promo_prices
app.get('/api/getPromoPrices', (req, res) => {
  const query = 'SELECT * FROM promo_prices';

  connection.query(query, (error, results, fields) => {
    if (error) {
      console.error('Ошибка запроса к базе данных:', error);
      res.status(500).json({ error: 'Ошибка сервера' });
    } else {
      res.json(results);
    }
  });
});

app.listen(port, () => {
  console.log(`Сервер запущен на http://localhost:${port}`);
});
