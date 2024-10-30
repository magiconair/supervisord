FROM golang:1.23-alpine AS builder
WORKDIR /src
COPY . ./
RUN CGO_ENABLED=0 go build -tags release

FROM scratch
COPY --from=builder /src/supervisord /usr/local/bin/supervisord
ENTRYPOINT ["/usr/local/bin/supervisord"]
