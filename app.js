const express = require('express');
const app = express();
const path = require('path');
const bodyParser = require('body-parser');
const session = require('express-session');
const flash = require('connect-flash');
const pool = require('./models/db'); // Import the PostgreSQL pool

// Set up view engine
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

// Middleware for parsing request bodies
app.use(bodyParser.urlencoded({ extended: false }));

// Set up sessions and flash messages
app.use(
  session({
    secret: 'secret-key',
    resave: false,
    saveUninitialized: true,
  })
);
app.use(flash());

// Serve static files from the 'public' directory
app.use(express.static(path.join(__dirname, 'public')));

// Set up routes
const indexRoutes = require('./routes/index');
const searchRoutes = require('./routes/search'); // Add this line
app.use('/', indexRoutes);
app.use('/search', searchRoutes); // Add this line

// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
