-- Domain-owned grants; migration history is deliberately excluded.
GRANT USAGE ON SCHEMA academic_schema TO academic_reader, academic_writer;
GRANT SELECT ON academic_schema.subjects, academic_schema.assignments, academic_schema.grades, academic_schema.outbox_events TO academic_reader;
GRANT SELECT, INSERT, UPDATE, DELETE ON academic_schema.subjects, academic_schema.assignments, academic_schema.grades, academic_schema.outbox_events TO academic_writer;
