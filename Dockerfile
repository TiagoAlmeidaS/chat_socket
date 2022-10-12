FROM cirrusci/flutter:latest AS builder
RUN mkdir /build
ADD . /build/
WORKDIR /build
RUN flutter build web

FROM httpd:alpine
COPY --from=builder /build/build/web/* /usr/local/apache2/htdocs/