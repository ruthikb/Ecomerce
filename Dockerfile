FROM maven:3.9.4-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests
FROM tomcat:10.1
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8082
CMD ["catalina.sh", "run"]