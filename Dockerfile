# Use an official Wildfly image as a base
FROM jboss/wildfly:11.0.0.Final

# Set environment variables
ENV GEOSERVER_VERSION=2.21.4
ENV POSTGRESQL_VERSION=42.2.20

# Install PostgreSQL JDBC driver
RUN mkdir -p /opt/jboss/wildfly/modules/org/postgresql/main
RUN curl -o /opt/jboss/wildfly/modules/org/postgresql/main/postgresql-${POSTGRESQL_VERSION}.jar https://jdbc.postgresql.org/download/postgresql-${POSTGRESQL_VERSION}.jar

# Add PostgreSQL module configuration
COPY module.xml /opt/jboss/wildfly/modules/org/postgresql/main/module.xml

# Download and deploy GeoServer
RUN curl -L -o /tmp/geoserver-${GEOSERVER_VERSION}-war.zip https://sourceforge.net/projects/geoserver/files/GeoServer/${GEOSERVER_VERSION}/geoserver-${GEOSERVER_VERSION}-war.zip/download && \
    unzip /tmp/geoserver-${GEOSERVER_VERSION}-war.zip -d /tmp && \
    mv /tmp/geoserver.war /opt/jboss/wildfly/standalone/deployments/

# Copy standalone configuration with datasource settings
# COPY standalone.xml /opt/jboss/wildfly/standalone/configuration/standalone.xml

# Expose default Wildfly port
EXPOSE 8080

# Start Wildfly server
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]
