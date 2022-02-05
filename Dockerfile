FROM ubuntu:latest
RUN apt update && apt upgrade -y

CMD ["echo('Hi there!')"]
