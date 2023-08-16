const { MongoClient } = require('mongodb');

const url = 'mongodb://127.0.0.1:27017/cooking_and_baking';
const client = new MongoClient(url, { useNewUrlParser: true, useUnifiedTopology: true });

async function connectToDatabase() {
  try {
    await client.connect();
    console.log('Connected to MongoDB');
  } catch (error) {
    console.error('Error connecting to MongoDB:', error);
  }
}

function getClient() {
  return client;
}

module.exports = {
  connectToDatabase,
  getClient, // Add this line to export the getClient function
};

