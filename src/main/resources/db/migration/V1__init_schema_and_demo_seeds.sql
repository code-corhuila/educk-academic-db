-- =============================================================================
-- V1 & V2: Esquema y Datos Semilla - Académico & Calificaciones (educk-academic-db :5432)
-- =============================================================================

CREATE TABLE IF NOT EXISTS courses (
    id VARCHAR(36) PRIMARY KEY,
    code VARCHAR(20) UNIQUE NOT NULL,
    name VARCHAR(120) NOT NULL,
    teacher_id VARCHAR(36) NOT NULL,
    academic_period VARCHAR(20) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS enrollments (
    id VARCHAR(36) PRIMARY KEY,
    course_id VARCHAR(36) REFERENCES courses(id) ON DELETE CASCADE,
    student_id VARCHAR(36) NOT NULL,
    enrolled_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(course_id, student_id)
);

CREATE TABLE IF NOT EXISTS evaluation_terms (
    id SERIAL PRIMARY KEY,
    course_id VARCHAR(36) REFERENCES courses(id) ON DELETE CASCADE,
    name VARCHAR(50) NOT NULL,
    weight_percentage NUMERIC(5,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS grades (
    id VARCHAR(36) PRIMARY KEY,
    enrollment_id VARCHAR(36) REFERENCES enrollments(id) ON DELETE CASCADE,
    term_id INT REFERENCES evaluation_terms(id),
    score NUMERIC(3,2) NOT NULL CHECK (score >= 0.0 AND score <= 5.0),
    feedback TEXT,
    graded_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Cursos y Asignaturas
INSERT INTO courses (id, code, name, teacher_id, academic_period) VALUES
('crs-dist-001', 'DIST-2026B', 'Sistemas Distribuidos 2026-B', 'usr-profe-001', '2026-2'),
('crs-arq-002', 'ARQ-2026B', 'Arquitectura de Software', 'usr-profe-001', '2026-2')
ON CONFLICT (code) DO NOTHING;

-- Periodos de Evaluación (Cortes 1, 2 y 3)
INSERT INTO evaluation_terms (id, course_id, name, weight_percentage) VALUES
(1, 'crs-dist-001', 'Corte 1 - Arquitectura y Fundamentos', 30.00),
(2, 'crs-dist-001', 'Corte 2 - Microservicios y Gobernanza', 35.00),
(3, 'crs-dist-001', 'Corte 3 - Proyecto Final y Resiliencia', 35.00)
ON CONFLICT DO NOTHING;

-- Matrícula de los 4 Integrantes
INSERT INTO enrollments (id, course_id, student_id) VALUES
('enr-001', 'crs-dist-001', 'usr-estud-001'),
('enr-002', 'crs-dist-001', 'usr-estud-002'),
('enr-003', 'crs-dist-001', 'usr-estud-003'),
('enr-004', 'crs-dist-001', 'usr-estud-004')
ON CONFLICT DO NOTHING;

-- Calificaciones Corte 1 (Calificaciones Reales Aprobadas)
INSERT INTO grades (id, enrollment_id, term_id, score, feedback) VALUES
('grd-001', 'enr-001', 1, 4.80, 'Excelente diseño de microfrontends y modularidad UI.'),
('grd-002', 'enr-002', 1, 4.70, 'Sólida implementación de arquitectura hexagonal y contratos.'),
('grd-003', 'enr-003', 1, 4.90, 'Rigurosa justificación de orden causal y modelo de seguridad.'),
('grd-004', 'enr-004', 1, 5.00, 'Liderazgo técnico intachable, automatizaciones de gobernanza y despliegue impecable.')
ON CONFLICT DO NOTHING;
