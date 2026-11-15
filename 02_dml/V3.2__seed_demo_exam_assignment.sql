-- V3.2__seed_demo_exam_assignment.sql
-- Actividad "Examen final" (Matemáticas) sin calificar, para que el docente la califique en vivo
-- desde el portal (POST /api/v1/grades) en la demostración.
INSERT INTO assignments (id, subject_id, title, description, due_date, status)
VALUES (
  '00000000-0000-4000-8000-000000000307',
  '00000000-0000-4000-8000-000000000101',
  'Examen final',
  'Evaluación final del periodo, pendiente de calificar',
  CURRENT_DATE,
  'PENDING'
)
ON CONFLICT (id) DO NOTHING;
