# Stage 1: Build
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run
FROM eclipse-temurin:17-jre
WORKDIR /app

# Copy the generated war and rename it to app.war for simplicity
COPY --from=build /app/target/Kishan-Setu-1.0.war app.war

# Render uses the PORT environment variable, Spring Boot picks this up
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.war"]