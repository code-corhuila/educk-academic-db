-- Seeds de prueba para materias y calificaciones
INSERT INTO subjects (id, name, school_id, teacher_id)
VALUES ('33333333-3333-3333-3333-333333333333', 'Sistemas Distribuidos 2026-B', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222')
ON CONFLICT (id) DO NOTHING;

INSERT INTO assignments (id, subject_id, title, due_date)
VALUES ('44444444-4444-4444-4444-444444444444', '33333333-3333-3333-3333-333333333333', 'Entrega Corte 1 - Walking Skeleton y Arquitectura Hexagonal', CURRENT_DATE)
ON CONFLICT (id) DO NOTHING;
