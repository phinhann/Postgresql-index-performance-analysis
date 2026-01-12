use online_retail;

// POINT query (hot key)
db.transactions
  .find({ StockCode_str: "85123A" })
  .hint({ StockCode_str: 1 })
  .explain("executionStats");

// POINT baseline (force COLLSCAN)
db.transactions
  .find({ StockCode_str: "85123A" })
  .hint({ $natural: 1 })
  .explain("executionStats");

// RANGE query
db.transactions
  .find({ StockCode_str: { $gte: "22000", $lte: "23000" } })
  .hint({ StockCode_str: 1 })
  .explain("executionStats");

// RANGE baseline (force COLLSCAN)
db.transactions
  .find({ StockCode_str: { $gte: "22000", $lte: "23000" } })
  .hint({ $natural: 1 })
  .explain("executionStats");
