const transporter = require('../configs/mailConfiguration')


function invioOrdineConferma(orderData) {

    const { mail, name, orderID, total_price, products } = orderData
    console.log(products);
    const productList = products
        .map(product => `${product?.name} x ${product?.quantity}`)
        .join("\n");




    // Configure the mailoptions object
    const mailOptions = {
        from: "info@mailtrap.club",
        to: mail,
        subject: 'Conferma ordine ricevuto!',
        text: `
        Ciao ${name}, grazie per il tuo ordine!
        Numero ordine: ${orderID}
        Totale: €${total_price}
        Prodotti acquistati: ${productList}
        A presto!`

    };

    // Send the email
    transporter.sendMail(mailOptions, function (error, info) {
        if (error) {
            console.log('Error:', error);
        } else {
            console.log('Email sent:', info.response);
        }
    });
}

function vendorConfirmOrder(orderData) {

    const { mail, surname, name, address, orderID, total_price, products } = orderData
    const productList = products
        .map(product => `${product?.name} x ${product?.quantity}`)
        .join("\n");




    // Configure the mailoptions object
    const mailOptions = {
        from: "info@mailtrap.club",
        to: "info@mailtrap.club",
        subject: 'Nuovo ordine ricevuto!',
        text: `
        L'ordine n°${orderID} di ${surname} ${name} è stato ricevuto.
        Mail cliente: ${mail}
        Indirizzo: ${address}
        Totale: €${total_price}
        Prodotti acquistati: ${productList}`
    };

    // Send the email
    transporter.sendMail(mailOptions, function (error, info) {
        if (error) {
            console.log('Error:', error);
        } else {
            console.log('Email sent:', info.response);
        }
    });
}

function welcomeMail(mail) {

    const popMail = {
        from: "info@mailtrap.club",
        to: mail,
        subject: 'Benvenuto in StarDisk!',
        text: 'Ti ringraziamo per aver visitato il nostro sito!'
    }

    transporter.sendMail(popMail, function (error, info) {
        if (error) {
            console.log('Error:', error);
        } else {
            console.log('Email sent:', info.response);
        }
    })

}

module.exports = { invioOrdineConferma, vendorConfirmOrder, welcomeMail }









