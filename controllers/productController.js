const connection = require("../database/connection");
//index
function index(req, res) {
  const sql = "SELECT * from products";

  connection.query(sql, (err, results) => {
    if (err) {
      return res.status(500).json({
        error: true,
        message: err.message
      })
    }
    /* console.log(results); */
    res.json(results);
  })
}

//show
function show(req, res) {
  const id = Number(req.params.id);
  const sql = "SELECT * from products WHERE id = ?";

  connection.query(sql, [id], (err, results) => {
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
  })
}

//store
function store(req, res) {

  const sql = 'INSERT INTO products (name, slug, full_price, discount, amount, img_url, category, brand, color, rpm, release_year, description, id_artist, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
  const schema = [name, slug, full_price, discount, amount, img_url, category, brand, color, rpm, release_year, description, id_artist, created_at]
  connection.query(sql, schema, (err, results) => {
    if (err) {
      console.error('Errore durante inserimento:', err);
      return res.status(500).json({ error: 'Errore nel server' })
    }

    const newProduct = {
      id: results.insertId,
      name: req.body.name,
      slug: req.body.slug,
      full_price: req.body.full_price,
      discount: req.body.discount,
      amount: req.body.amount,
      img_url: req.body.image,
      category: req.body.category,
      brand: req.body.brand,
      color: req.body.color,
      rpm: req.body.rpm,
      release_year: req.bosy.release_year,
      description: req.body.description,
      id_artist: req.body.id_artist,
      created_at: req.body.created_at
    }
    res.status(201).json(newProduct);
  })
}

module.exports = {
  index,
  show,
  store
}