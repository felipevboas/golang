FROM golang:1.17-alpine3.15 AS base
WORKDIR /src
COPY /src/. .
RUN go build -ldflags '-w -s -extldflags "-static"' -a -o application hello.go

FROM scratch
WORKDIR /src
COPY --from=base /src ./
CMD ["./application"]