# Stage 1: Build
FROM golang:1.22-alpine AS builder

WORKDIR /app

# Copy all source files
COPY . .

# Initialize module (if not exists) and tidy
RUN go mod init hello-world-go || true
RUN go mod tidy

# Build binary
RUN go build -o main .

# Stage 2: Run
FROM alpine:latest

WORKDIR /root/
COPY --from=builder /app/main .

CMD ["./main"]


