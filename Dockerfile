FROM gradle:6.0-jdk8 AS GRADLE_BUILD

COPY build.gradle /home/gradle/project/
COPY settings.gradle /home/gradle/project/
COPY properties.gradle /home/gradle/project/
COPY database/build.gradle /home/gradle/project/database/
COPY database/src/ /home/gradle/project/database/src/

WORKDIR /home/gradle/project
RUN gradle clean distTar

FROM store/oracle/serverjre:8

COPY --from=GRADLE_BUILD /home/gradle/project/database/build/distributions/database-1.0-SNAPSHOT.tar /app/
RUN tar -xf /app/database-1.0-SNAPSHOT.tar -C /app && rm /app/database-1.0-SNAPSHOT.tar
CMD /app/database-1.0-SNAPSHOT/bin/database