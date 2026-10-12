# Academic runtime alignment

Apply V2.3 after V2.2 using the existing Flyway locations. Preserve earlier
migrations and database volumes. V2.3 permits the API's 0–5 score range and
preserves two decimal places; weights must be greater than zero and at most one.
Existing invalid weights fail migration rather than being silently rewritten.

The paired API maps academic_schema and resolves the subject from the assignment.
It records the authenticated teacher and rejects assignments belonging to others.
Run its PostgreSQL integration test with -Dacademic.db.path pointing here.
