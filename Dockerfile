# Stage 1: Build the application with Maven
FROM maven:3.6.3-jdk-8 AS build
WORKDIR /app
COPY . /app
RUN mvn clean package

# Stage 2: Create a lightweight image to run the application
FROM openjdk:8-jre
WORKDIR /app
COPY --from=build /app/target/hello-world-1.0-SNAPSHOT-jar-with-dependencies.jar /app/hello-world.jar
ENTRYPOINT ["java", "-jar", "/app/hello-world.jar"]
