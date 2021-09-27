FROM tomcat

WORKDIR /app

RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git

WORKDIR boxfuse-sample-java-war-hello

EXPOSE 8080

CMD ["catalina.sh", "run"]
