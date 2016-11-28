FROM ubuntu:14.04
MAINTAINER lichao <lichao@goodrain.com>
RUN echo "Asia/Shanghai" > /etc/timezone;dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update && apt-get install -y curl vim net-tools && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /app
## Install JDK 7
WORKDIR /app
RUN  curl -L 'http://download.oracle.com/otn-pub/java/jdk/7u65-b17/jdk-7u65-linux-x64.tar.gz' -H 'Cookie: oraclelicense=accept-securebackup-cookie; gpw_e24=Dockerfile' | tar -xz \
    && curl -L 'http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.8/bin/apache-tomcat-7.0.8.tar.gz' | tar -xz

# copy scripts to docker container
COPY run.sh /app/run.sh
COPY tomcat7.sh /app/tomcat7.sh
RUN chmod +x /app/run.sh
RUN chmod +x /app/tomcat7.sh

COPY java-war.war /app/java-war.war

# Expose ports.
EXPOSE 8080
  
# Define default command.  
ENTRYPOINT ["/app/tomcat7.sh"]
#ENTRYPOINT ["/app/run.sh"]