FROM golang:latest

RUN mkdir -p /go/src/github.com/elastic/
RUN mkdir -p /elk-usg/filebeat
RUN mkdir -p /elk-usg/metricbeat
COPY cp.sh /root/cp.sh
RUN chmod +x /root/cp.sh
RUN git clone -b v6.5.1 https://github.com/elastic/beats.git /go/src/github.com/elastic/beats

WORKDIR /go/src/github.com/elastic/beats/filebeat

RUN GOOS=linux GOARCH=mips64 go build -v -o /elk-usg/filebeat/filebeat

WORKDIR /go/src/github.com/elastic/beats/metricbeat

RUN GOOS=linux GOARCH=mips64 go build -v -o /elk-usg/metricbeat/metricbeat
CMD ["ls -larth /elk-usg && ls -larth /download && cp -r /elk-usg /download"]
