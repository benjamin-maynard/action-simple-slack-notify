FROM python:3.7.4-alpine3.10

RUN pip3 install requests

WORKDIR /usr/src/app

COPY slackMessage.py .

CMD [ "python", "./slackMessage.py" ]