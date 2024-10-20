FROM maven:3.6.3-jdk-8 AS build
WORKDIR /app
COPY ..
RUN mvn clean package
FROM openjdk:8-jre
WORKDIR /app
COPY --from=build/app/target/hello-world-1.0-SNAPSHOT.jar /app/hello-world.jar
ENTRYPOINT ["java","-jar","/app/hello-world.jar"]