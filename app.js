const express = require('express');
const app = express();
const path = require('path');
const bodyParser = require('body-parser');
const session = require('express-session');
const flash = require('connect-flash');
const pool = require('./models/db');
const authMiddleware = require('./authMiddleware');


app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));
app.use(bodyParser.urlencoded({ extended: false }));
app.use(
  session({
    secret: 'secret-key',
    resave: false,
    saveUninitialized: true,
  })
);
app.use(flash());
app.use(authMiddleware);
app.use(express.static(path.join(__dirname, 'public')));

const authRoutes = require('./routes/auth');
const indexRoutes = require('./routes/index');
const searchRoutes = require('./routes/search');

app.use('/', indexRoutes); // Landing page
app.use('/auth', authRoutes); // Authentication
app.use('/search', searchRoutes); // Search functionality

app.use(flash());

app.use('/', indexRoutes); // Landing page
app.use('/auth', authRoutes); // Authentication
app.use('/search', searchRoutes); // Search functionality

// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
