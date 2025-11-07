# Dockerfile

# Use the official MySQL image as the base
FROM mysql:8.0

# Copy the initialization script into the entrypoint directory.
# The official MySQL image automatically executes scripts here on first run.
# The 01-init.sql file is in the mysql/ subdirectory.
COPY mysql/01-init.sql /docker-entrypoint-initdb.d/