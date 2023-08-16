const express = require('express');
const router = express.Router();
const db = require('../models/db');
const bcrypt = require('bcrypt'); // Import bcrypt for password hashing
const flash = require('connect-flash');

// Signup page
router.get('/signup', (req, res) => {
  res.render('signup', { errorMessage: req.flash('error'), successMessage: req.flash('success') });
});

// Handle signup form submission
router.post('/signup', async (req, res) => {
  const { username, password } = req.body;

  try {
    const hashedPassword = await bcrypt.hash(password, 10);

    await db.query(
      'INSERT INTO users (username, password) VALUES ($1, $2)',
      [username, hashedPassword]
    );
    req.flash('success', 'Signup successful! You can now log in.');
    res.redirect('/auth/login');
  } catch (err) {
    console.error('Error during signup:', err);
    if (err.code === '23505') {
      req.flash('error', 'Username already taken.');
    } else if (err.code === '23502') {
    } else {
      req.flash('error', 'An error occurred during signup.');
    }
    res.redirect('/auth/signup');
  }
});

// Login page
router.get('/login', (req, res) => {
  res.render('login', { errorMessage: req.flash('error'), successMessage: req.flash('success'), currentUser: res.locals.currentUser });
});

// Handle login form submission
router.post('/login', async (req, res) => {
  const { username, password } = req.body;

  try {
    const result = await db.query('SELECT * FROM users WHERE username = $1', [
      username,
    ]);

    if (result.rows.length === 0) {
      req.flash('error', 'Incorrect username or password');
      res.redirect('/auth/login');
      return;
    }

    const user = result.rows[0];

    const passwordMatch = await bcrypt.compare(password, user.password);

    if (passwordMatch) {

      req.session.userId = user.id;

      req.flash('success', 'Login successful! Welcome back.');
      res.redirect('/landing');
    } else {
      req.flash('error', 'Incorrect username or password');
      res.redirect('/auth/login');
    }
  } catch (err) {
    console.error('Error during login:', err);
    req.flash('error', 'An error occurred during login.');
    res.redirect('/auth/login');
  }
});

router.get('/logout', (req, res) => {
  req.session.destroy(err => {
    if (err) {
      console.error('Error destroying session:', err);
    }
    res.render('logout');
  });
});

  
module.exports = router;






