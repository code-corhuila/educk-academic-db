-- Align persisted values with the API's zero-to-five grading scale.
ALTER TABLE academic_schema.grades
    ALTER COLUMN grade TYPE NUMERIC(4,2),
    ALTER COLUMN weight TYPE NUMERIC(5,4),
    DROP CONSTRAINT grades_grade_check;
ALTER TABLE academic_schema.grades
    ADD CONSTRAINT grades_grade_check CHECK (grade >= 0 AND grade <= 5),
    ADD CONSTRAINT grades_weight_check CHECK (weight > 0 AND weight <= 1);
