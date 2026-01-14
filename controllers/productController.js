const connection = require("../database/connection");

// Index
function index(req, res) {
  const sql = `SELECT 
  products.id AS product_id, 
  products.name AS name, 
  products.slug, 
  products.full_price, 
  products.discount, 
  products.amount, 
  products.img_url, 
  products.category, 
  products.brand, 
  products.color, 
  products.rpm, 
  products.release_year, 
  products.description, 
  artists.name AS artist_name, 
  genres.name as genre_name 
  FROM products 
  LEFT JOIN artists ON artists.id = products.id_artist 
  LEFT JOIN product_genres ON product_genres.id_product = products.id 
  LEFT JOIN genres ON genres.id = product_genres.id_genre`;

  connection.query(sql, (err, results) => {
    if (err) {
      return res.status(500).json({
        error: true,
        message: err.message
      })
    }
    res.json(results);
  })
}

// Show
function show(req, res) {
  const slug = req.params.slug;
  const sql = `SELECT 
  products.id AS product_id, 
  products.name AS name, 
  products.full_price, 
  products.discount, 
  products.amount, 
  products.img_url, 
  products.category, 
  products.brand, 
  products.color, 
  products.rpm, 
  products.release_year, 
  products.description, 
  artists.name AS artist_name, 
  artists.description AS artist_description, 
  artists.record_label, 
  genres.name as genre_name 
  FROM products 
  LEFT JOIN artists ON artists.id = products.id_artist 
  LEFT JOIN product_genres ON product_genres.id_product = products.id 
  LEFT JOIN genres ON genres.id = product_genres.id_genre 
  WHERE products.slug = ?`;

  connection.query(sql, [slug], (err, results) => {
    if (err) {
      return res.status(500).json({
        error: true,
        message: err.message
      })
    }
    //console.log(results);
    if (results.length === 0) {
      return res.status(404).json({
        error: true,
        message: "Product not found"
      })
    }
    res.json(results);
  });
}

// Related
function related(req, res) {
  const slug = req.params.slug;
  const sql = `
    SELECT DISTINCT p.*
    FROM products p
    JOIN product_genres pg ON p.id = pg.id_product
    WHERE pg.id_genre IN (
      SELECT pg2.id_genre
      FROM products p2
      JOIN product_genres pg2 ON p2.id = pg2.id_product
      WHERE p2.slug = ?
    )
    AND p.slug != ?
    AND p.category = 'vinyl'
    LIMIT 3
  `;

  connection.query(sql, [slug, slug], (err, results) => {
    if (err) {
      return res.status(500).json({
        error: true,
        message: err.message
      });
    }

    res.json(results);
  });
}




module.exports = {
  index,
  show,
  related
}