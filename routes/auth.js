const express = require('express');
const router = express.Router();
const db = require('../models/db'); // Import the database connection
const bcrypt = require('bcrypt'); // Import bcrypt for password hashing

// Render the signup page
router.get('/signup', (req, res) => {
  res.render('signup', { errorMessage: req.flash('error'), successMessage: req.flash('success') });
});

// Handle form submission for user signup
router.post('/signup', async (req, res) => {
  const { username, email, password } = req.body;

  try {
    // Hash the user's password for security
    const hashedPassword = await bcrypt.hash(password, 10);

    // Insert new user data into the database
    await db.query(
      'INSERT INTO users (username, email, password) VALUES ($1, $2, $3)',
      [username, email, hashedPassword]
    );

    // Display success message and redirect to login page
    req.flash('success', 'Signup successful! You can now log in.');
    res.redirect('/auth/login');
  } catch (err) {
    console.error('Error during signup:', err);

    // Handle errors during signup
    if (err.code === '23505') {
      req.flash('error', 'Username already taken.');
    } else if (err.code === '23502') {
      // Handle missing data error (if needed)
    } else {
      req.flash('error', 'An error occurred during signup.');
    }

    // Redirect back to signup page with error message
    res.redirect('/auth/signup');
  }
});

// Render the login page
router.get('/login', (req, res) => {
  res.render('login', { errorMessage: req.flash('error'), successMessage: req.flash('success'), currentUser: res.locals.currentUser });
});

// Handle form submission for user login
router.post('/login', async (req, res) => {
  const { username, password } = req.body;

  try {
    // Retrieve user data from the database
    const result = await db.query('SELECT * FROM users WHERE username = $1', [
      username,
    ]);

    // Check if username exists
    if (result.rows.length === 0) {
      req.flash('error', 'Incorrect username or password');
      res.redirect('/auth/login');
      return;
    }

    // Compare user-provided password with hashed password in the database
    const user = result.rows[0];
    const passwordMatch = await bcrypt.compare(password, user.password);

    if (passwordMatch) {
      // Set the user's session and redirect to landing page
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

// Handle user logout
router.get('/logout', (req, res) => {
  req.session.destroy(err => {
    if (err) {
      console.error('Error destroying session:', err);
    }

    // Render the logout page
    res.render('logout');
  });
});

// Export the router
module.exports = router;




