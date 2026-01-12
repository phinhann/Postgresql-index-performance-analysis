use online_retail;

// A) BSON type distribution on original StockCode
db.transactions.aggregate([
  { $project: { t: { $type: "$StockCode" } } },
  { $group: { _id: "$t", count: { $sum: 1 } } },
  { $sort: { count: -1 } }
]);

// B) Top-5 hot keys on normalized StockCode_str
db.transactions.aggregate([
  { $match: { StockCode_str: { $exists: true } } },
  { $group: { _id: "$StockCode_str", c: { $sum: 1 } } },
  { $sort: { c: -1 } },
  { $limit: 5 }
]);
