const express = require('express');
const router = express.Router();
const db = require('../models/db');
const bcrypt = require('bcrypt');

// Signup page
router.get('/signup', (req, res) => {
  res.render('signup', { message: req.flash('signupMessage') });
});

// Handle signup form submission
router.post('/signup', async (req, res) => {
    const { username, password } = req.body;
  
    try {
      // Check if the username already exists
      const existingUser = await db.query('SELECT * FROM users WHERE username = $1', [username]);
  
      if (existingUser.rows.length > 0) {
        // Username already exists, show an error message
        req.flash('signupMessage', 'Username is already taken');
        res.redirect('/auth/signup');
        return;
      }
  
      // Hash the user's password
      const hashedPassword = await bcrypt.hash(password, 10);
  
      // Save the user's information to the database
      const user = await db.query(
        'INSERT INTO users (username, password) VALUES ($1, $2) RETURNING id',
        [username, hashedPassword]
      );
  
      // Redirect to the login page after successful signup
      res.redirect('/auth/login');
    } catch (err) {
      console.error('Error during signup:', err);
      res.send('An error occurred during signup.');
    }
  });
  






// Login page
router.get('/login', (req, res) => {
    res.render('login', { message: req.flash('loginMessage') });
  });

module.exports = router;




