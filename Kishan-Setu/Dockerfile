

# Stage 1: Build with Maven
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
# Copy your pom.xml and source code
COPY . .
# Build the project and skip tests for speed
RUN mvn clean package -DskipTests

# Stage 2: Runtime
FROM eclipse-temurin:17-jre
WORKDIR /app
# THE FIX: Copy the generated JAR from the target folder to app.jar
COPY --from=build /app/target/*.jar app.jar
# Expose the port Render expects
EXPOSE 8080
# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]