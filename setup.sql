-- PASO 1: Ejecuta esto en Supabase > SQL Editor > New Query
-- Crea todo desde cero limpio

CREATE TABLE IF NOT EXISTS eventos (
  id BIGSERIAL PRIMARY KEY,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  nombre_evento TEXT,
  tipo TEXT DEFAULT 'social',
  fecha DATE,
  estado TEXT DEFAULT 'pendiente',
  horario_inicio TEXT,
  horario_llegada_evento TEXT,
  horario_partida TEXT,
  horario_llegada_maikels TEXT,
  lugar TEXT,
  direccion TEXT,
  nombre_cliente TEXT,
  telefono TEXT,
  cant_invitados INTEGER DEFAULT 0,
  extras_info TEXT,
  cant_pizzas INTEGER DEFAULT 0,
  cant_personal INTEGER DEFAULT 0,
  nombres_personal TEXT,
  notas TEXT,
  servicio_tipo TEXT,
  total_cobrado NUMERIC DEFAULT 0,
  costo_materia_prima NUMERIC DEFAULT 0,
  celiacos NUMERIC DEFAULT 0,
  entradas NUMERIC DEFAULT 0,
  tortas NUMERIC DEFAULT 0,
  personal NUMERIC DEFAULT 0,
  nafta NUMERIC DEFAULT 0,
  bebida NUMERIC DEFAULT 0,
  otros NUMERIC DEFAULT 0,
  extras_total NUMERIC DEFAULT 0,
  sena NUMERIC DEFAULT 0,
  fecha_sena DATE,
  resta_abonar NUMERIC DEFAULT 0,
  fecha_resto DATE
);

ALTER TABLE eventos ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "allow_all" ON eventos;
CREATE POLICY "allow_all" ON eventos FOR ALL USING (true) WITH CHECK (true);

-- Reload schema cache
NOTIFY pgrst, 'reload schema';
