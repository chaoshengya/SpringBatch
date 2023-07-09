FROM fabric8/java-jboss-openjdk8-jdk:1.2.3
USER root
ENV HOME="/root"
RUN localedef -i zh_CN -f UTF-8 zh_CN.UTF-8
ENV LANG zh_CN.utf8
ENV LC_ALL zh_CN.utf8
RUN echo 'Asia/Shanghai' > /etc/timezone
WORKDIR ${HOME}
COPY /target/portal.jar  ${HOME}/ROOT.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar","-Xms2048m","-Xmx2048m","-XX:NewRatio=1","-XX:SurvivorRatio=10", "ROOT.jar"]
