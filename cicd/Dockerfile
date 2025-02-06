FROM postgres:15-alpine
#FROM amazoncorretto:11-al2-jdk
# RUN mkdir /usr/local/bin

EXPOSE 443
EXPOSE 8080

ADD ./cicd/query-db.sh /
# ADD query-db.sh /  # to run from local ec2
RUN chmod +x /query-db.sh

CMD ["/query-db.sh"]
