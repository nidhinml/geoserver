# GeoServer with PostgreSQL and Wildfly on Render

This repository contains the necessary files to set up a GeoServer instance with PostgreSQL and Wildfly on Render.

## Folder Structure

- `Dockerfile`: Docker configuration for building the environment.
- `module.xml`: Configuration file for the PostgreSQL JDBC module in Wildfly.
- `standalone.xml`: Wildfly configuration file with datasource settings.
- `README.md`: This file.

## Setup Instructions

1. **Clone the Repository**:
    ```sh
    git clone https://github.com/yourusername/my-gis-server.git
    cd my-gis-server
    ```

2. **Configure Environment Variables**:
    Set the following environment variables in your Render dashboard:
    - `DATABASE_HOST`: The hostname of your PostgreSQL instance.
    - `DATABASE_PORT`: The port number of your PostgreSQL instance (default is `5432`).
    - `DATABASE_NAME`: The name of your PostgreSQL database.
    - `DATABASE_USER`: The username for your PostgreSQL database.
    - `DATABASE_PASSWORD`: The password for your PostgreSQL database.

3. **Deploy to Render**:
    - Go to your Render dashboard.
    - Click "New" and select "Web Service".
    - Connect your GitHub repository.
    - Configure the service and deploy.

4. **Access GeoServer**:
    - Once deployed, access GeoServer at `http://<your-render-url>:8080/geoserver`.
    - Log in with the default credentials (`admin` / `geoserver`) and configure your data stores to connect to the PostgreSQL database.

## Notes

- Ensure you change the default GeoServer credentials after the first login for security reasons.
- Monitor your resource usage on Render to stay within the free tier limits.
