const connection = require("../database/connection");

function index(req, res){
  const sql = "SELECT * from products";

  connection.query(sql, (err, results) => {
    if(err){
      return res.status(500).json({
        error: true,
        message: err.message
      })
    }
    /* console.log(results); */
    res.json(results);
  })
}
  
function show(req, res){
  const id = Number(req.params.id);
  const sql = "SELECT * from products WHERE id = ?";

  connection.query(sql, [id], (err, results) => {
    if(err){
      return res.status(500).json({
        error: true,
        message: err.message
      })
    }
    //console.log(results);
    if(results.length === 0){
      return res.status(404).json({
        error: true,
        message: "Product not found"
      })
    }
    res.json(results);
  })
}

module.exports = {
  index,
  show
}