FROM tomcat:9.0

#ADD tomcat-users.xml /usr/local/tomcat/conf
#ADD manager.xml /usr/local/tomcat/conf/Catalina/localhost/manager.xml

RUN mv /usr/local/tomcat/webapps /usr/local/tomcat/webapps2
RUN mv /usr/local/tomcat/webapps.dist /usr/local/tomcat/webapps
COPY manager.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml
COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
CMD ["catalina.sh", "run"]
