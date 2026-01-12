const connection = require('../database/connection')

//show

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
    store

}