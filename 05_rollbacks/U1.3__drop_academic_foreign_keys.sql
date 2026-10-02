ALTER TABLE academic_schema.grades DROP CONSTRAINT IF EXISTS fk_grades_assignment;
ALTER TABLE academic_schema.grades DROP CONSTRAINT IF EXISTS fk_grades_subject;
ALTER TABLE academic_schema.assignments DROP CONSTRAINT IF EXISTS fk_assignments_subject;
