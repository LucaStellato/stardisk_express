const connection = require('../database/connection')

//show
function show(req, res) {
    const id = Number(req.params.id);
    const sql = 'SELECT * FROM orders WHERE id = ?'
    connection.query(sql, [id], (err, results) => {
        if (err) return res.status(500).json({ error: true, err: err.message });
        if (results.length === 0) return res.status(404).json({ err: "Prodotto non trovato" })
        console.log(err, results);
        res.json(results[0])
    })
}

//store
function store(req, res) {
    const { mail, name, surname, address, card_number, total_price, free_shipment } = req.body;

    const sql = 'INSERT INTO orders (mail, name, surname, address, card_number, total_price, free_shipment) VALUES (?, ?, ?, ?, ?, ?, ?)'
    connection.query(sql, [mail, name, surname, address, card_number, total_price, free_shipment], (err, results) => {
        if (err) return res.status(500).json({ error: err.message })
        res.status(201).json({ message: 'Ordine creato!' })

    })
}

module.exports = {
    show,
    store
}