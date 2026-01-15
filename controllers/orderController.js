const connection = require('../database/connection')

function emailIsValid(mail){
    return /^[^\s@]+@[^\s@]+$/.test(mail)
}

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
    const { mail, name, surname, address, total_price, free_shipment } = req.body;

    const sql = 'INSERT INTO orders (mail, name, surname, address, total_price, free_shipment) VALUES (?, ?, ?, ?, ?, ?)'

    const array = [mail, name, surname, address, total_price, free_shipment]

    connection.query(sql, array, (err, results) => {
        if (err) return res.status(500).json({ error: err.message })
        if(!emailIsValid(mail)) return res.status(422).json({ message: "Wrong email input"})
        res.status(201).json({ message: 'Ordine creato!' })

    })
}

module.exports = {
    show,
    store
}