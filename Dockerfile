FROM alpine:latest as stage

ADD https://fonts.google.com/download?family=Rubik /tmp/fonts.zip
RUN unzip /tmp/fonts.zip -d /tmp/fonts

FROM gotenberg/gotenberg:8.1.0

USER root

COPY --from=stage /tmp/fonts/static/* /usr/local/share/fonts/

USER gotenberg

