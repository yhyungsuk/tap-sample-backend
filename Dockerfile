# BUILD
FROM adoptopenjdk/openjdk8 as build

COPY . .
RUN rm -rf target *.iml

RUN ./mvnw -B package -Dmaven.test.skip

# RUN
FROM adoptopenjdk/openjdk8
ENV PROFILE dev

COPY --from=build target/backend-0.0.1-SNAPSHOT.jar .

EXPOSE 8080
ENTRYPOINT ["java", "-Dspring.profiles.active=${PROFILE}", "-jar", "backend-0.0.1-SNAPSHOT.jar"]
