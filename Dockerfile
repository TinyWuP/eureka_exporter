FROM golang:alpine AS build
RUN apk --update add git

WORKDIR /src
ADD go.mod .
ADD go.sum .

ENV GO111MODULE=on \
    GOPROXY=https://goproxy.io \
    CGO_ENABLED=0

COPY . .
RUN go mod download && \
    go build -o eureka-exporter cmd/eureka_exporter.go

FROM alpine:3.18.2
COPY --from=build /src/eureka-exporter /
ENTRYPOINT /eureka-exporter
