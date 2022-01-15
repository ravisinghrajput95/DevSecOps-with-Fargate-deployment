# Pull the base image
FROM maven:3.6.1-jdk-8-alpine AS MAVEN_BUILD
 
# copy the pom and src code to the container
COPY ./ ./
 
# package our application code
RUN mvn clean package
 
# the second stage of our build will use open jdk 8 on alpine 3.9
From tomcat:8-jre8 
 
# copy only the artifacts we need from the first stage and discard the rest
COPY --from=MAVEN_BUILD target/*.war /usr/local/tomcat/webapps

# Expose the port to access the app
EXPOSE 8080

# Entrypoint to start the process in the container
ENTRYPOINT ["sh", "/usr/local/tomcat/bin/startup.sh"]
 
