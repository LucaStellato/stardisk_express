const connection = require("../database/connection");

// Show artist
function showArtist(req, res) {
    const artistId = req.params.id;

    const sql =
        `SELECT artists.name AS artist, artists.record_label, artists.img_url AS artist_img, artists.description AS artist_description, artists.id AS artist_id, products.name AS name, products.full_price, products.img_url
        FROM artists
        INNER JOIN products ON artists.id = products.id_artist
        WHERE artists.id = ? AND products.category = 'vinyl'`;

    connection.query(sql, [artistId], (err, results) => {
        if (err) return res.status(500).send(err);

        if (results.length === 0) {
            return res.status(404).json({ message: "Any vinyls found within this artist" });
        }

        const artist = {
            name: results[0].artist,
            record_label: results[0].record_label,
            description: results[0].artist_description,
            artist_img: results[0].artist_img,
            vinyls: []
        };

        // 2. Usiamo un ciclo for per aggiungere ogni disco alla lista
        for (let i = 0; i < results.length; i++) {
            const disk = {
                name: results[i].name,
                price: results[i].full_price,
                image: results[i].img_url
            };

            // Aggiungiamo il disco nell'array dell'artista
            artist.vinyls.push(disk);
        }

        // 3. Inviamo l'oggetto finale al frontend
        res.json(artist);
    });
};

module.exports = { showArtist };