# Start with a base image containing Java runtime
FROM openjdk:8u212-jdk-slim

# ADD Maintainer Info
LABEL maintainer="shanqyeet@gmail.com"

# Add a volume pointing to /tmp
VOLUME /tmp

# Make port 8080 available to the world outside this container
EXPOSE 8080

# The application's jar file
ARG JAR_FILE=target/spring-kubernetes-0.0.1-SNAPSHOT.jar

# Add the application's jar to the container
ADD ${JAR_FILE} spring-kubernetes.jar

# Run teh jar file
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/spring-kubernetes.jar"]
