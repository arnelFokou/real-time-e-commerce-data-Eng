-- 1. Insertion de 12 produits
INSERT INTO products (product_ean, product_name, unit_price) VALUES 
('3017620422003', 'Eau Minérale 1.5L', 0.65),
('3270190022351', 'Pâtes Penne 500g', 1.10),
('3033490004758', 'Tomates Pelées 400g', 0.85),
('3168930000000', 'Café Moulu 250g', 3.50),
('3560070725530', 'Lait Demi-écrémé 1L', 0.95),
('3057640103522', 'Riz Basmati 1kg', 2.20),
('3228020010834', 'Huile d Olive 1L', 6.50),
('3456789012345', 'Thon au naturel 140g', 1.80),
('3560070996848', 'Chocolat Noir 100g', 1.30),
('3017800010045', 'Yaourts Nature x4', 1.50),
('3256220808001', 'Pommes Gala 1kg', 2.80),
('3560070995001', 'Pain de mie complet', 1.25)
ON CONFLICT (product_ean) DO NOTHING;

-- 2. Initialisation des stocks pour ces 12 produits
INSERT INTO inventory (product_ean, current_stock) VALUES 
('3017620422003', 200),
('3270190022351', 150),
('3033490004758', 80),
('3168930000000', 40),
('3560070725530', 300),
('3057640103522', 120),
('3228020010834', 60),
('3456789012345', 100),
('3560070996848', 90),
('3017800010045', 150),
('3256220808001', 200),
('3560070995001', 75)
ON CONFLICT (product_ean) DO NOTHING;