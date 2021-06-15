FROM tomcat:9.0

#ADD tomcat-users.xml /usr/local/tomcat/conf
#ADD manager.xml /usr/local/tomcat/conf/Catalina/localhost/manager.xml

RUN mv /usr/local/tomcat/webapps /usr/local/tomcat/webapps2
RUN mv /usr/local/tomcat/webapps.dist /usr/local/tomcat/webapps
COPY manager.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml
COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
CMD ["catalina.sh", "run"]

# docker build -t schogini/tomcat-deployable .
# docker run -d -p 9090:8080 schogini/tomcat-deployable
# curl -T staging/SreeJavaExample.war "http://tomcat:s3cret@34.200.241.212:9090/manager/text/deploy?path=/sree&update=true"
