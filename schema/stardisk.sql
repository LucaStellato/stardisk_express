-- 1. Tabella Generi
CREATE TABLE genres (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL
);

-- 2. Tabella Artisti
CREATE TABLE artists (
    id BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT NULL,
    record_label VARCHAR(100) NOT NULL
);

-- 3. Tabella Prodotti (Unificata come da schema)
CREATE TABLE products (
    id BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(255) NOT NULL,
    slug VARCHAR(255) UNIQUE NOT NULL,
    full_price DECIMAL(10,2) NOT NULL,
    discount SMALLINT DEFAULT 0,
    amount INT DEFAULT 0,
    img_url VARCHAR(255) NULL,
    category VARCHAR(10) NOT NULL,
    brand VARCHAR(100) NULL,
    color VARCHAR(50) NULL,
    rpm SMALLINT NULL,
    release_year YEAR NULL,
    description TEXT NULL,
    id_artist BIGINT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_product_artist FOREIGN KEY (id_artist) REFERENCES artists(id) ON DELETE SET NULL
);

-- 4. Tabella Ordini
CREATE TABLE orders (
    id BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    mail VARCHAR(50) NOT NULL,
    name VARCHAR(255) NOT NULL,
    surname VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    free_shipment BOOLEAN DEFAULT FALSE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 5. Tabella Pivot Prodotti-Ordini
CREATE TABLE product_orders (
    id_product BIGINT NOT NULL,
    id_orders BIGINT NOT NULL,
    products_amount INT DEFAULT 0,
    PRIMARY KEY (id_product, id_orders),
    CONSTRAINT fk_pivot_product FOREIGN KEY (id_product) REFERENCES products(id) ON DELETE CASCADE,
    CONSTRAINT fk_pivot_order FOREIGN KEY (id_orders) REFERENCES orders(id) ON DELETE CASCADE
);

-- 6. Tabella Pivot Prodotti-Generi
CREATE TABLE product_genres (
    id_product BIGINT NOT NULL,
    id_genre INT NOT NULL,
    PRIMARY KEY (id_product, id_genre),
    CONSTRAINT fk_genre_product FOREIGN KEY (id_product) REFERENCES products(id) ON DELETE CASCADE,
    CONSTRAINT fk_genre_id FOREIGN KEY (id_genre) REFERENCES genres(id) ON DELETE CASCADE
);

-- --- POPOLAMENTO DATI ---

-- Inserimento Generi
INSERT INTO genres (name) VALUES ('Rock'), ('Electronic'), ('Jazz'), ('Pop'), ('Hip Hop');

-- Inserimento Artisti
INSERT INTO artists (name, description, record_label) VALUES 
('Pink Floyd', 'Leggendaria band progressive rock.', 'EMI'),
('Daft Punk', 'Duo elettronico francese.', 'Virgin'),
('Miles Davis', 'Icona del jazz.', 'Columbia'),
('The Beatles', 'La band più influente di sempre.', 'Apple Records'),
('Michael Jackson', 'Il Re del Pop.', 'Epic');

-- Inserimento 20 Prodotti (Vinili e Giradischi insieme)
INSERT INTO products (name, slug, full_price, discount, amount, category, brand, color, rpm, release_year, description, id_artist) VALUES 
-- Vinili
('The Dark Side of the Moon', 'dark-side-moon', 35.00, 10, 20, 'vinyl', NULL, 'Black', 33, 1973, 'Capolavoro Progressive.', 1),
('Discovery', 'daft-punk-discovery', 28.00, 0, 15, 'vinyl', NULL, 'Silver', 33, 2001, 'House music classica.', 2),
('Kind of Blue', 'miles-davis-kind-of-blue', 30.00, 5, 10, 'vinyl', NULL, 'Blue', 33, 1959, 'Jazz modale.', 3),
('Abbey Road', 'beatles-abbey-road', 32.00, 0, 12, 'vinyl', NULL, 'Black', 33, 1969, 'Ultimo album registrato.', 4),
('Thriller', 'mj-thriller', 38.00, 0, 25, 'vinyl', NULL, 'Black', 33, 1982, 'L album dei record.', 5),
('The Wall', 'pink-floyd-the-wall', 45.00, 15, 8, 'vinyl', NULL, 'White', 33, 1979, 'Opera rock.', 1),
('Random Access Memories', 'daft-punk-ram', 40.00, 0, 10, 'vinyl', NULL, 'Black', 33, 2013, 'Vincitore Grammy.', 2),
('Bitches Brew', 'miles-davis-bitches', 34.00, 0, 5, 'vinyl', NULL, 'Black', 33, 1970, 'Jazz fusion.', 3),
('Let It Be', 'beatles-let-it-be', 29.00, 5, 14, 'vinyl', NULL, 'Black', 33, 1970, 'Versione rimasterizzata.', 4),
('Bad', 'mj-bad', 31.00, 10, 18, 'vinyl', NULL, 'Black', 33, 1987, 'Pop perfezionato.', 5),
('Homework', 'daft-punk-homework', 27.00, 0, 9, 'vinyl', NULL, 'Black', 33, 1997, 'Techno grezza.', 2),
('Wish You Were Here', 'pink-floyd-wywh', 36.00, 0, 11, 'vinyl', NULL, 'Blue', 33, 1975, 'Tributo a Syd Barrett.', 1),
('Rubber Soul', 'beatles-rubber-soul', 28.00, 0, 7, 'vinyl', NULL, 'Black', 33, 1965, 'Svolta folk-rock.', 4),

-- Giradischi (Usano i campi brand e color)
('Audio-Technica AT-LP120X', 'at-lp120x-bk', 299.00, 0, 5, 'turntable', 'Audio-Technica', 'Black', NULL, NULL, 'Trazione diretta.', NULL),
('Sony PS-LX310BT', 'sony-ps-lx310bt', 249.00, 10, 8, 'turntable', 'Sony', 'Black', NULL, NULL, 'Bluetooth integrato.', NULL),
('Pro-Ject Debut Carbon', 'project-debut-red', 449.00, 0, 3, 'turntable', 'Pro-Ject', 'Red', NULL, NULL, 'Braccio in carbonio.', NULL),
('Rega Planar 1', 'rega-planar-1-wh', 320.00, 0, 4, 'turntable', 'Rega', 'White', NULL, NULL, 'Plug and Play.', NULL),
('Lenco L-3808', 'lenco-l3808-wh', 199.00, 15, 12, 'turntable', 'Lenco', 'White', NULL, NULL, 'Economico con USB.', NULL),
('Technics SL-1210GR', 'technics-sl1210', 1499.00, 0, 2, 'turntable', 'Technics', 'Black', NULL, NULL, 'Standard professionale.', NULL),
('Denon DP-300F', 'denon-dp300f', 349.00, 0, 6, 'turntable', 'Denon', 'Silver', NULL, NULL, 'Automatico.', NULL);

-- Associazione Prodotti-Generi (Esempio per i primi vinili)
INSERT INTO product_genres (id_product, id_genre) VALUES 
(1, 1), (6, 1), (12, 1), -- Rock
(2, 2), (7, 2), (11, 2), -- Electronic
(3, 3), (8, 3),          -- Jazz
(4, 4), (5, 4), (9, 4), (10, 4), (13, 4); -- Pop