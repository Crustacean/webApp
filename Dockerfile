FROM tomcat:8

MAINTAINER elkana <elkyem@gmail.com>

COPY ./target/*.war /usr/local/tomcat/webapps/

CMD ["catalina.sh", "run"]