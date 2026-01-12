use online_retail;

// BSON type distribution on original StockCode
db.transactions.aggregate([
  { $group: { _id: { $type: "$StockCode" }, c: { $sum: 1 } } },
  { $sort: { c: -1 } }
]);

// Top-5 hot keys on normalized StockCode_str
db.transactions.aggregate([
  { $match: { StockCode_str: { $exists: true } } },
  { $group: { _id: "$StockCode_str", c: { $sum: 1 } } },
  { $sort: { c: -1 } },
  { $limit: 5 }
]);
