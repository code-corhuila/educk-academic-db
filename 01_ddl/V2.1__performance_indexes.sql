CREATE INDEX IF NOT EXISTS idx_grades_student_id ON academic_schema.grades(student_id);
CREATE INDEX IF NOT EXISTS idx_grades_assignment_id ON academic_schema.grades(assignment_id);
CREATE INDEX IF NOT EXISTS idx_outbox_events_status ON academic_schema.outbox_events(status);
