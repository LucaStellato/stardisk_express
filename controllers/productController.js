const connection = require("../database/connection");

function index(req, res){
  const sql = "SELECT products.id AS product_id, products.name AS product_name, products.full_price, products.discount, products.amount, products.img_url, products.category, products.brand, products.color, products.rpm, products.release_year, products.description, artists.name AS artist_name, genres.name as genre_name FROM products LEFT JOIN artists ON artists.id = products.id_artist LEFT JOIN product_genres ON product_genres.id_product = products.id LEFT JOIN genres ON genres.id = product_genres.id_genre";

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