ALTER TABLE academic_schema.assignments 
ADD CONSTRAINT fk_assignments_subject FOREIGN KEY (subject_id) REFERENCES academic_schema.subjects(id) ON DELETE CASCADE;

ALTER TABLE academic_schema.grades 
ADD CONSTRAINT fk_grades_subject FOREIGN KEY (subject_id) REFERENCES academic_schema.subjects(id) ON DELETE CASCADE,
ADD CONSTRAINT fk_grades_assignment FOREIGN KEY (assignment_id) REFERENCES academic_schema.assignments(id) ON DELETE CASCADE;
