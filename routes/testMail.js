const express = require("express")
const { welcomeMail } = require("../services/mail")
const router = express.Router()



router.post("/mail", (req, res) => {
    const { mail } = req.body;
    console.log(mail);

    if (!mail) return res.status(400).json({ message: 'mail mancante' })
    welcomeMail(mail); res.sendStatus(204)



})

module.exports = router;