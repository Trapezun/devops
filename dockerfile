FROM maven AS builder 

RUN apk update
RUN apk add git

WORKDIR /app

RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git

WORKDIR boxfuse-sample-java-war-hello

RUN mvn package

FROM tomcat AS runner

COPY --from=builder  /app/boxfuse-sample-java-war-hello/target/hello-1.0.war  /usr/local/tomcat/webapps/hello-1.0.war

EXPOSE 8080

CMD ["catalina.sh", "run"]