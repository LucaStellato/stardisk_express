const connection = require('../database/connection')

function emailIsValid(mail) {
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
    const { mail, name, surname, address, total_price, free_shipment, products } = req.body;

    //insert order
    const sql = 'INSERT INTO orders (mail, name, surname, address, total_price, free_shipment) VALUES (?, ?, ?, ?, ?, ?)'
    const array = [mail, name, surname, address, total_price, free_shipment]

    connection.query(sql, array, (err, results) => {
        if (err) return res.status(500).json({ error: err.message })
        if (!emailIsValid(mail)) return res.status(422).json({ message: "Wrong email input" })
        /* res.status(201).json({ message: 'Ordine creato!' }) */

        const orderID = results.insertId;
        // insert into pivot
        const sqlPivot = 'INSERT INTO product_orders (id_orders, id_product, products_amount) VALUES ?';

        const pivotData = products.map(product => [
            orderID,
            product.id,
            product.quantity
        ])

        connection.query(sqlPivot, [pivotData], (err) => {
            if (err) {
                return res.status(500).json({ error: err.message });
            }

        })
        res.status(201).json({ success: true, order_id: orderID });
    })
}

module.exports = {
    show,
    store
}