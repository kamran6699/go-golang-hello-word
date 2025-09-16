FROM golang:1.21-alpine AS builder

WORKDIR /app

# Copy all files (including main.go)
COPY . .

# Build the Go binary
RUN go build -o main .

FROM alpine:latest

WORKDIR /root/

# Copy binary from builder stage
COPY --from=builder /app/main .

# Run binary
CMD ["./main"]


