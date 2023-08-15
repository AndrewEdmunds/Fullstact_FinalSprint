const express = require('express');
const router = express.Router();
const db = require('../models/db');

// Search route
router.get('/', async (req, res) => {
  try {
    const query = req.query.query;

    const recipes = await db.query(
      'SELECT * FROM recipes WHERE title ILIKE $1 OR ingredients ILIKE $2',
      [`%${query}%`, `%${query}%`]
    );

    res.render('search_results', { recipes: recipes.rows });
  } catch (err) {
    console.error('Error executing search query:', err);
    res.send('An error occurred while searching.');
  }
});

module.exports = router;


