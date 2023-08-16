const db = require('./models/db');

module.exports = async (req, res, next) => {
  if (req.session.userId) {
    try {
      const result = await db.query('SELECT username FROM users WHERE id = $1', [
        req.session.userId,
      ]);
      if (result.rows.length > 0) {
        res.locals.currentUser = result.rows[0].username;
      }
    } catch (err) {
      console.error('Error fetching user:', err);
    }
  } else {
    res.locals.currentUser = null;
  }
  next();
};