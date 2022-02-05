FROM ubuntu:latest
RUN apt update && apt upgrade -y
RUN apt install nodejs
RUN node -v
