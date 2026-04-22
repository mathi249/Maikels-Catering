-- Tabla de ingredientes del menú
CREATE TABLE ingredientes (
  id BIGSERIAL PRIMARY KEY,
  nombre TEXT NOT NULL,
  cat TEXT NOT NULL,
  costo DECIMAL(10,2) NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Tabla de eventos de catering
CREATE TABLE eventos (
  id BIGSERIAL PRIMARY KEY,
  cliente TEXT NOT NULL,
  tipo TEXT NOT NULL,
  fecha DATE NOT NULL,
  personas INTEGER NOT NULL,
  budget DECIMAL(10,2) NOT NULL,
  porciones INTEGER DEFAULT 2,
  telefono TEXT,
  lugar TEXT,
  notas TEXT,
  servicios TEXT[],
  ingredientes BIGINT[],
  costo_est DECIMAL(10,2) DEFAULT 0,
  cpp DECIMAL(10,2) DEFAULT 0,
  estado TEXT DEFAULT 'pendiente',
  created_at TIMESTAMP DEFAULT NOW()
);

-- Datos iniciales del menú
INSERT INTO ingredientes (nombre, cat, costo) VALUES
  ('Pepperoni', 'topping', 0.80),
  ('Champiñones', 'topping', 0.50),
  ('Jamón', 'topping', 0.70),
  ('Pimentón rojo', 'topping', 0.40),
  ('Aceitunas', 'topping', 0.60),
  ('Queso extra', 'topping', 0.90),
  ('Cebolla caramelizada', 'topping', 0.45),
  ('Tocineta', 'topping', 0.85),
  ('Masa tradicional', 'base', 1.50),
  ('Masa integral', 'base', 1.80),
  ('Salsa tomate', 'base', 0.30),
  ('Salsa blanca', 'base', 0.50),
  ('Ensalada Caesar', 'entrada', 2.50),
  ('Pan de ajo', 'entrada', 1.20),
  ('Bruschetta', 'entrada', 1.80),
  ('Tiramisú', 'postre', 2.00),
  ('Brownie con helado', 'postre', 1.80),
  ('Panna cotta', 'postre', 1.60),
  ('Refresco', 'bebida', 1.00),
  ('Agua mineral', 'bebida', 0.60),
  ('Jugo natural', 'bebida', 1.50);

-- Permitir acceso público (Row Level Security desactivado para simplicidad)
ALTER TABLE ingredientes ENABLE ROW LEVEL SECURITY;
ALTER TABLE eventos ENABLE ROW LEVEL SECURITY;

CREATE POLICY "public_all_ingredientes" ON ingredientes FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "public_all_eventos" ON eventos FOR ALL USING (true) WITH CHECK (true);
