const express = require('express');
const router = express.Router();
const db = require('../models/db');
const mongodb = require('../models/mongodb');

// Search route
router.get('/', async (req, res) => {
  try {
    const query = req.query.query;
    const database = req.query.database;

    let recipes = [];

    if (database === 'postgre' || database === 'both') {
      const pgRecipes = await db.query(
        'SELECT * FROM recipes WHERE title ILIKE $1 OR ingredients ILIKE $2',
        [`%${query}%`, `%${query}%`]
      );
      recipes.push(...pgRecipes.rows);
    }

    if (database === 'mongo' || database === 'both') {
      await mongodb.connectToDatabase();
      const mongoRecipes = await mongodb.searchRecipes(query);
      recipes.push(...mongoRecipes);
    }

    res.render('search_results', { recipes });
  } catch (err) {
    console.error('Error executing search query:', err);
    res.send('An error occurred while searching.');
  }
});

module.exports = router;



