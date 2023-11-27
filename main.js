// На первом блоке кнопка “Узнать подробнее” должна скроллить страницу к следующему блоку с ценами. Кнопка “Бесплатная консультация” должна вести вниз, к блоку с формой.
// Блок цен должен выводиться с использованием данных из таблицы promo_prices в БД. Для гарантии вывода в правильном порядке предусмотрено поле order.
// Заявки из формы “Ещё думаете?” сохранять в таблицу applications. После отправки скрыть форму и показать сообщение об успешной отправке (или ошибке).

document.addEventListener('DOMContentLoaded', () => {
  // Получаем кнопку "Узнать подробнее"
  const learnMoreButton = document.querySelector('.learn_more');

  // Обработчик события клика по кнопке
  learnMoreButton.addEventListener('click', (event) => {
    // Отменяем стандартное поведение ссылки
    event.preventDefault();

    // Получаем элемент, к которому хотим прокрутить страницу
    const courseSelectionElement = document.querySelector('.course_selection');

    // Проверяем, существует ли элемент
    if (courseSelectionElement) {
      // Прокручиваем страницу к элементу с использованием плавного эффекта
      // behavior: 'smooth' для плавного скролинга
      courseSelectionElement.scrollIntoView({ behavior: 'smooth' });
    }
  });
});

document.addEventListener('DOMContentLoaded', () => {
  const consultationButton = document.querySelector('.consultation');

  consultationButton.addEventListener('click', (event) => {
    event.preventDefault();

    const stillThinkingAndSignUp = document.querySelector(
      '.still_thinking_and_sign_up'
    );

    if (stillThinkingAndSignUp) {
      stillThinkingAndSignUp.scrollIntoView({ behavior: 'smooth' });
    }
  });
});

//const loginInput = document.querySelector('#login');
//const loginError = document.querySelector('#');
const inputElements = document.querySelectorAll('.inputs_text');
const phoneInput = document.querySelector('#phone');
const phoneError = document.querySelector('#phoneError');
const emailInput = document.querySelector('#mail');
const emailError = document.querySelector('#mailError');
const signBtn = document.querySelector('#sign');

// Добавляем обработчик события на кнопку "Оформить"
signBtn.addEventListener('click', (event) => {
  event.preventDefault(); // Отменяем отправку формы по умолчанию
  validateInputs();
  console.log('test');
});

// Добавляем обработчик события на изменение содержимого инпутов
inputElements.forEach((input) => {
  input.addEventListener('input', () => {
    if (formSubmitted) {
      validateInput(this);
    }
  });

  // Добавляем обработчик события на потерю фокуса инпута
  input.addEventListener('blur', () => {
    if (formSubmitted) {
      validateInput(this);
    }
  });
});

function validateInputs() {
  inputElements.forEach((input) => {
    validateInput(input);
  });
}

let formSubmitted = false;

function validateInput(input) {
  const value = input.value.trim();
  const id = input.id;

  if (value === '') {
    // Пустое поле
    input.classList.remove('error');
    input.style.color = ''; // Убираем явно заданный цвет текста при ошибке
    if (id === 'mail') {
      emailError.textContent = '';
      emailError.style.display = 'none';
    } else if (id === 'phone') {
      phoneError.textContent = '';
      phoneError.style.display = 'none';
    }
  } else {
    // Непустое поле - проводим дополнительные проверки в зависимости от ID
    if (id === 'mail') {
      // Проверка почты
      if (!validateEmail(value)) {
        input.classList.add('error');
        input.style.color = 'var(--system-orange, #F55123)'; // Устанавливаем цвет текста при ошибке
        emailError.textContent = 'Проверьте адрес электронной почты';
        emailError.style.display = 'block';
      } else {
        input.classList.remove('error');
        input.style.color = ''; // Убираем явно заданный цвет текста при успешной валидации
        emailError.textContent = '';
        emailError.style.display = 'none';
      }
    } else if (id === 'phone') {
      // Проверка номера телефона
      if (!validatePhoneNumber(value)) {
        input.classList.add('error');
        input.style.color = 'var(--system-orange, #F55123)'; // Устанавливаем цвет текста при ошибке
        phoneError.textContent = 'Формат: +9 999 999 99 99';
        phoneError.style.display = 'block';
      } else {
        input.classList.remove('error');
        input.style.color = ''; // Убираем явно заданный цвет текста при успешной валидации
        phoneError.textContent = '';
        phoneError.style.display = 'none';
      }
    } else {
      // Остальные поля
      input.classList.remove('error');
      input.style.color = ''; // Убираем явно заданный цвет текста при успешной валидации
      if (id === 'mail') {
        emailError.textContent = '';
        emailError.style.display = 'none';
      } else if (id === 'phone') {
        phoneError.textContent = '';
        phoneError.style.display = 'none';
      }
    }
  }
}

function validateEmail(email) {
  // Простая проверка адреса электронной почты
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return emailRegex.test(email);
}

function validatePhoneNumber(phone) {
  // Проверка формата номера телефона: +9 999 999 99 99
  const phoneRegex = /^\+\d{1} \d{3} \d{3} \d{2} \d{2}$/;
  return phoneRegex.test(phone);
}

const { log } = require('console');
const mysql = require('./mysql.sql');

// Создаем подключение к базе данных
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'ваш_пользователь',
  password: 'ваш_пароль',
  database: 'ваша_база_данных',
});

// Открываем подключение
connection.connect((err) => {
  if (err) {
    console.error('Ошибка подключения к базе данных:', err);
    return;
  }
  console.log('Подключение к базе данных успешно');

  //  SQL-запрос
  const sqlQuery = 'SELECT * FROM applications';

  // Выполняем запрос к базе данных
  connection.query(sqlQuery, (error, results, fields) => {
    if (error) {
      console.error('Ошибка выполнения запроса:', error);
      return;
    }

    // Результаты запроса
    console.log('Результаты запроса:', results);

    // Закрываем подключение
    connection.end((err) => {
      if (err) {
        console.error('Ошибка закрытия подключения:', err);
      } else {
        console.log('Подключение к базе данных закрыто');
      }
    });
  });
});
