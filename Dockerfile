FROM python:3.7.4-alpine3.10

RUN pip3 install requests

COPY slackMessage.py /usr/src/app/

CMD [ "python", "/usr/src/app/slackMessage.py" ]