-- Bootstrap a new local database; existing volumes require forward migration.
\i /migrations/01_ddl/V1.1__create_academic_schema.sql
\i /migrations/01_ddl/V1.2__create_academic_tables.sql
\i /migrations/04_alter/V1.3__add_academic_foreign_keys.sql
\i /migrations/01_ddl/V2.1__performance_indexes.sql
\i /migrations/04_alter/V2.2__add_weight_to_grades.sql
\i /migrations/04_alter/V2.3__align_grade_precision.sql
