// Import the Nodemailer library
const nodemailer = require('nodemailer');

// Create a transporter object
const transporter = nodemailer.createTransport({
    host: process.env.MAIL_HOST,
    port: Number(process.env.MAIL_PORT),
    secure: false, // use SSL
    auth: {
        user: process.env.MAIL_USER,
        pass: process.env.MAIL_PASS,
    }
});



module.exports = transporter