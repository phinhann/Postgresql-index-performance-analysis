use online_retail;

// POINT query (hot key) - with index
db.transactions
  .find({ StockCode_str: "85123A" })
  .hint({ StockCode_str: 1 })
  .explain("executionStats");

// POINT query baseline - force COLLSCAN
db.transactions
  .find({ StockCode_str: "85123A" })
  .hint({ $natural: 1 })
  .explain("executionStats");

// RANGE query - with index
db.transactions
  .find({ StockCode_str: { $gte: "22000", $lte: "23000" } })
  .hint({ StockCode_str: 1 })
  .explain("executionStats");

// RANGE query baseline - force COLLSCAN
db.transactions
  .find({ StockCode_str: { $gte: "22000", $lte: "23000" } })
  .hint({ $natural: 1 })
  .explain("executionStats");
