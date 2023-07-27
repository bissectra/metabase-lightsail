
# Step 3: Docker-Compose Config
echo "Step 3: Docker-Compose configuration"
mkdir Metabase && cd Metabase/
cat << EOF > docker-compose.yml
version: "3"
services:
  postgres-db:
    image: postgres
    restart: always
    ports:
      - 5432:5432
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
      POSTGRES_DB: metabase
      PGDATA: /var/lib/postgresql/data
    volumes:
      - /home/ubuntu/pgdata:/var/lib/postgresql/data
  metabase-app:
    image: metabase/metabase
    restart: always
    ports:
      - 3000:3000
    volumes:
      - /home/ubuntu/metabase-data:/metabase-data
    environment:
      MB_DB_TYPE: postgres
      MB_DB_DBNAME: metabase
      MB_DB_PORT: 5432
      MB_DB_USER: postgres
      MB_DB_PASS: postgres
      MB_DB_HOST: postgres-db
      MB_DB_CONNECTION_TIMEOUT_MS: 300000
      MB_SITE_URL: https://metabase1.tutormundi.com
    depends_on:
      - postgres-db
    links:
      - postgres-db
EOF
echo "Docker-Compose configuration completed."
