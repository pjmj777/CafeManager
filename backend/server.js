// server.js

const express = require('express');
const mongoose = require('mongoose');

// Set up the Express app
const app = express();
const PORT = process.env.PORT || 5000;

// Connect to MongoDB
mongoose.connect('mongodb://localhost/cafe_manager', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
})
  .then(() => {
    console.log('Connected to MongoDB');
  })
  .catch((error) => {
    console.error('Failed to connect to MongoDB:', error);
  });

// Set up middleware
app.use(express.json());

// Define API routes
app.use('/api/supplies', require('./routes/supplyRoutes'));
app.use('/api/suppliers', require('./routes/supplierRoutes'));
app.use('/api/items', require('./routes/inventoryItemRoutes'));
app.use('/api/purchaseOrders', require('./routes/purchaseOrderRoutes'));
app.use('/api/recipes', require('./routes/recipeRoutes'));

// Start the server
app.listen(PORT, () => {
  console.log(`CafeManager server is running on port ${PORT}`);
});
