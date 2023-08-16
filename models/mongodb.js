const { MongoClient } = require('mongodb');

const url = 'mongodb://localhost:27017';
const client = new MongoClient(url, { useNewUrlParser: true, useUnifiedTopology: true });

async function connectToDatabase() {
  try {
    await client.connect();
    console.log('Connected to MongoDB');
  } catch (error) {
    console.error('Error connecting to MongoDB:', error);
  }
}

async function searchRecipes(query) {
  const db = client.db('cooking_and_baking');
  const collection = db.collection('recipes');

  try {
    const results = await collection.find({ $text: { $search: query } }).toArray();
    return results;
  } catch (error) {
    console.error('Error querying MongoDB:', error);
    return [];
  }
}

module.exports = {
  connectToDatabase,
  searchRecipes,
};
