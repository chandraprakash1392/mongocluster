FROM ubuntu:latest

# COPY entrypoint.sh /



RUN apt-get update && apt-get upgrade -y
RUN apt-get install gnupg gnupg2 -y
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
RUN echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-3.4.list
RUN apt-get update
RUN apt-get install mongodb-org systemd -y
COPY mongod.service /lib/systemd/system/mongod.service
RUN systemctl enable mongod.service
# RUN systemctl enable mongos.service
# RUN chmod 755 /entrypoint.sh

EXPOSE 27019

ENTRYPOINT [ "/entrypoint.sh" ]