FROM java:openjdk-8-jre
VOLUME /images
ADD nmist-web-client-0.1-SNAPSHOT.jar nmist-web.jar
RUN bash -c 'touch /nmist-web.jar'
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /nmist-web.jar"]