FROM golang:1.21-alpine as gobuild

COPY ./ /app

WORKDIR /app

RUN go build -o /bin/github-actions-exporter

FROM prom/busybox:latest

COPY --from=gobuild /bin/github-actions-exporter /bin/github-actions-exporter

ENTRYPOINT [ "/bin/github-actions-exporter" ]