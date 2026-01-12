// Normalize StockCode into a single comparable type for fair predicates
use online_retail;

db.transactions.updateMany(
  {},
  [{ $set: { StockCode_str: { $toString: "$StockCode" } } }]
);

// Verify
db.transactions.countDocuments({ StockCode_str: { $exists: true } });
db.transactions.countDocuments({ StockCode_str: { $exists: false } });
