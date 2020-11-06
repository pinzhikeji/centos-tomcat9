FROM pinzhikeji/openj9

RUN wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.39/bin/apache-tomcat-9.0.39.tar.gz -q -O /tmp/tomcat9.tar.gz \
    && mkdir /usr/local/tomcat9 \
    && tar -xzvf /tmp/tomcat9.tar.gz -C /usr/local/tomcat9/ \
    && mv /usr/local/tomcat9/apache-tomcat-9.0.39/* /usr/local/tomcat9/ \
    && rm -rf /usr/local/tomcat9/apache-tomcat-9.0.39/ \
    && rm -rf /usr/local/tomcat9/webapps/examples/ \
    && rm -rf /usr/local/tomcat9/webapps/docs/ \
    && rm /tmp/tomcat9.tar.gz


ENV LANG=zh_CN.utf8 \
    LANGUAGE=zh_CN.utf8

WORKDIR /usr/local/tomcat9/bin

EXPOSE 8080

CMD ["./catalina.sh", "run"]