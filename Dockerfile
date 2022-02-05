FROM ubuntu:latest
RUN apt update && apt upgrade -y

CMD ["print('Hi there!')"]
