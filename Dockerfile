
############################
# STEP 1 build executable binary
############################
FROM golang:latest AS builder

RUN mkdir -p /go/src/github.com/elastic/
RUN mkdir -p /elk-usg/filebeat
RUN mkdir -p /elk-usg/metricbeat

RUN git clone -b v6.5.1 https://github.com/elastic/beats.git /go/src/github.com/elastic/beats

WORKDIR /go/src/github.com/elastic/beats/filebeat

RUN GOOS=linux GOARCH=mips64 go build -v -o /elk-usg/filebeat/filebeat

WORKDIR /go/src/github.com/elastic/beats/metricbeat

RUN GOOS=linux GOARCH=mips64 go build -v -o /elk-usg/metricbeat/metricbeat

############################
# STEP 2 build a small image
############################
FROM alpine:latest

COPY --from=builder /elk-usg /elk-usg

COPY ./cp.sh /
RUN chmod +x /cp.sh
#CMD ["sleep","9600"]
CMD ["/bin/sh", "/cp.sh", "/elk-usg/", "/download/"]
