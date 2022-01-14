FROM tomcat 
WORKDIR webapps 
COPY target/WebApp.war .
RUN rm -rf ROOT && mv WebApp.war ROOT.war
EXPOSE 80
ENTRYPOINT ["sh", "/usr/local/tomcat/bin/startup.sh"]
