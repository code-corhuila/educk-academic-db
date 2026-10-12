#!/bin/sh
set -eu
mkdir -p /tmp/domain-migrations
cp /domain/01_ddl/V1.2__create_academic_tables.sql /tmp/domain-migrations/
cp /domain/04_alter/V1.3__add_academic_foreign_keys.sql /tmp/domain-migrations/
cp /domain/01_ddl/V2.1__performance_indexes.sql /tmp/domain-migrations/
cp /domain/04_alter/V2.2__add_weight_to_grades.sql /tmp/domain-migrations/
cp /domain/04_alter/V2.3__align_grade_precision.sql /tmp/domain-migrations/
cp /domain/04_alter/V3__annex_j_permissions.sql /tmp/domain-migrations/
exec flyway -locations=filesystem:/tmp/domain-migrations -schemas=academic_schema -defaultSchema=academic_schema -cleanDisabled=true migrate
