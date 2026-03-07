-- 1. Création de la table des produits (le catalogue)
CREATE TABLE IF NOT EXISTS products (
    product_ean VARCHAR(20) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL
);
  -- 2. Création de la table d'inventaire (le stock actuel)
CREATE TABLE IF NOT EXISTS inventory (
    product_ean VARCHAR(20) PRIMARY KEY,
    current_stock INTEGER DEFAULT 0,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_product 
        FOREIGN KEY(product_ean) 
        REFERENCES products(product_ean)
);

-- 3. Création de la table des ventes (les événements de vente)
CREATE TABLE IF NOT EXISTS sales (
    sale_id SERIAL PRIMARY KEY,
    product_ean VARCHAR(20) NOT NULL,
    quantity_sold INTEGER NOT NULL,
    sale_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_price DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_product_sale 
        FOREIGN KEY(product_ean) 
        REFERENCES products(product_ean)
);
