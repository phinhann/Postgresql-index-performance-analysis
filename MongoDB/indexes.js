use online_retail;

// Create index
db.transactions.createIndex({ StockCode_str: 1 });

// Verify index exists
db.transactions.getIndexes();

// Drop index (baseline scenario)
// db.transactions.dropIndex("StockCode_str_1");
