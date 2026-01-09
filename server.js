const express = require('express')
const app = express()
const port = 3000
const productsRouter = require('./routers/productsRouter')

app.use(express.static('public'));

app.use(express.json())

app.get('/', (req, res) => {
    res.send('Entry point server')
});

app.use("/products", productsRouter)

app.listen(port, () => {
    console.log(`We are listening on post ${port}`);

})


