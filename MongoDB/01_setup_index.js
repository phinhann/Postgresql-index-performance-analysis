use online_retail;

// 1) Normalize StockCode into StockCode_str for consistent comparisons
db.transactions.updateMany(
  {},
  [{ $set: { StockCode_str: { $toString: "$StockCode" } } }]
);

// 2) Verify normalization coverage
db.transactions.countDocuments({ StockCode_str: { $exists: true } });
db.transactions.countDocuments({ StockCode_str: { $exists: false } });

// 3) Create index on StockCode_str
db.transactions.createIndex({ StockCode_str: 1 });

// 4) Verify index exists
db.transactions.getIndexes();
