FROM golang:1.21-alpine AS builder

WORKDIR /app

# bas go.mod ko copy karo (agar file hai)
COPY go.mod ./

RUN go mod download || true

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM alpine:latest

WORKDIR /root/

COPY --from=builder /app/main .

CMD ["./main"]


