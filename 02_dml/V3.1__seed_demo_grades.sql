-- V3.1__seed_demo_grades.sql
-- Datos de demostracion para el estudiante Juan Sebastian Lopez (00000000-0000-4000-8000-000000000201)
-- 3 materias (Matematicas, Ciencias, Lenguaje), Periodo 2, con Lenguaje bajo 3.0 (2.7 promedio).

-- 1. Materias (Subjects)
INSERT INTO subjects (id, name, school_id, teacher_id, status)
VALUES
  ('00000000-0000-4000-8000-000000000101', 'Matemáticas', '11111111-1111-1111-1111-111111111111', 'e4876c7c-ffd7-405d-a3e6-833a6fc4ec9c', 'ACTIVE'),
  ('00000000-0000-4000-8000-000000000102', 'Ciencias',    '11111111-1111-1111-1111-111111111111', 'e4876c7c-ffd7-405d-a3e6-833a6fc4ec9c', 'ACTIVE'),
  ('00000000-0000-4000-8000-000000000103', 'Lenguaje',    '11111111-1111-1111-1111-111111111111', 'e4876c7c-ffd7-405d-a3e6-833a6fc4ec9c', 'ACTIVE')
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, status = EXCLUDED.status;

-- 2. Actividades (Assignments)
INSERT INTO assignments (id, subject_id, title, description, due_date, status)
VALUES
  ('00000000-0000-4000-8000-000000000301', '00000000-0000-4000-8000-000000000101', 'Quiz: Fracciones', 'Evaluación de operaciones con números fraccionarios', CURRENT_DATE - 14, 'GRADED'),
  ('00000000-0000-4000-8000-000000000302', '00000000-0000-4000-8000-000000000101', 'Proyecto de datos', 'Análisis estadístico descriptivo en equipos', CURRENT_DATE - 7, 'GRADED'),
  ('00000000-0000-4000-8000-000000000303', '00000000-0000-4000-8000-000000000102', 'Laboratorio 3', 'Informe de laboratorio sobre reacciones químicas', CURRENT_DATE - 12, 'GRADED'),
  ('00000000-0000-4000-8000-000000000304', '00000000-0000-4000-8000-000000000102', 'Taller Ecosistemas', 'Clasificación de biomas y cadenas tróficas', CURRENT_DATE - 5, 'GRADED'),
  ('00000000-0000-4000-8000-000000000305', '00000000-0000-4000-8000-000000000103', 'Ensayo corto', 'Redacción de texto argumentativo de 500 palabras', CURRENT_DATE - 10, 'GRADED'),
  ('00000000-0000-4000-8000-000000000306', '00000000-0000-4000-8000-000000000103', 'Control de lectura', 'Comprensión crítica de literatura hispanoamericana', CURRENT_DATE - 3, 'GRADED')
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, status = EXCLUDED.status;

-- 3. Calificaciones (Grades para Juan Sebastian Lopez 00000000-0000-4000-8000-000000000201)
INSERT INTO grades (id, student_id, subject_id, assignment_id, grade, weight, comment, graded_by, graded_at, created_at)
VALUES
  ('00000000-0000-4000-8000-000000000401', '00000000-0000-4000-8000-000000000201', '00000000-0000-4000-8000-000000000101', '00000000-0000-4000-8000-000000000301', 4.5, 0.40, 'Muy buen trabajo en fracciones', 'e4876c7c-ffd7-405d-a3e6-833a6fc4ec9c', NOW() - INTERVAL '14 days', NOW() - INTERVAL '14 days'),
  ('00000000-0000-4000-8000-000000000402', '00000000-0000-4000-8000-000000000201', '00000000-0000-4000-8000-000000000101', '00000000-0000-4000-8000-000000000302', 4.3, 0.60, 'Entrega completa y puntual', 'e4876c7c-ffd7-405d-a3e6-833a6fc4ec9c', NOW() - INTERVAL '7 days', NOW() - INTERVAL '7 days'),
  ('00000000-0000-4000-8000-000000000403', '00000000-0000-4000-8000-000000000201', '00000000-0000-4000-8000-000000000102', '00000000-0000-4000-8000-000000000303', 4.2, 0.50, 'Buen análisis experimental', 'e4876c7c-ffd7-405d-a3e6-833a6fc4ec9c', NOW() - INTERVAL '12 days', NOW() - INTERVAL '12 days'),
  ('00000000-0000-4000-8000-000000000404', '00000000-0000-4000-8000-000000000201', '00000000-0000-4000-8000-000000000102', '00000000-0000-4000-8000-000000000304', 4.0, 0.50, 'Participación destacada', 'e4876c7c-ffd7-405d-a3e6-833a6fc4ec9c', NOW() - INTERVAL '5 days', NOW() - INTERVAL '5 days'),
  ('00000000-0000-4000-8000-000000000405', '00000000-0000-4000-8000-000000000201', '00000000-0000-4000-8000-000000000103', '00000000-0000-4000-8000-000000000305', 2.8, 0.50, 'Reforzar estructura de tesis', 'e4876c7c-ffd7-405d-a3e6-833a6fc4ec9c', NOW() - INTERVAL '10 days', NOW() - INTERVAL '10 days'),
  ('00000000-0000-4000-8000-000000000406', '00000000-0000-4000-8000-000000000201', '00000000-0000-4000-8000-000000000103', '00000000-0000-4000-8000-000000000306', 2.6, 0.50, 'Debe mejorar comprensión crítica', 'e4876c7c-ffd7-405d-a3e6-833a6fc4ec9c', NOW() - INTERVAL '3 days', NOW() - INTERVAL '3 days')
ON CONFLICT (student_id, assignment_id) DO UPDATE SET grade = EXCLUDED.grade, weight = EXCLUDED.weight, comment = EXCLUDED.comment;
