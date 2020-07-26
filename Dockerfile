FROM ubuntu:latest

WORKDIR /helloworld

RUN apt-get update && \
    apt-get install -y --fix-missing \
    curl

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt install -y nodejs && \
    npm install -g @angular/cli@9

ADD .  /helloworld
RUN cd /helloworld && npm install

EXPOSE 3000

CMD sh start_services.sh
