
# Stage 1: Build the WAR using Maven
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Use Apache Tomcat to run the WAR
FROM eclipse-temurin:17-jre
WORKDIR /usr/local/tomcat

# Remove default Tomcat apps to keep it clean
RUN rm -rf webapps/*

# COPY your WAR file into the Tomcat webapps directory
# This renames it to ROOT.war so your app lives at the base URL (/)
COPY --from=build /app/target/*.war webapps/ROOT.war

# Tomcat runs on 8080 by default
EXPOSE 8080

CMD ["catalina.sh", "run"]