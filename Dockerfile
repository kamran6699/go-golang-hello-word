FROM golang:1.21-alpine AS builder

WORKDIR /app

# Copy dependency files first
COPY go.mod ./
# Agar go.sum file exist karti hai to copy karo, warna ignore ho jaayegi
COPY go.sum ./ || true
RUN go mod tidy

# Copy source code
COPY . .

# Build binary
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

# Final image
FROM alpine:latest

WORKDIR /root/

COPY --from=builder /app/main .

CMD ["./main"]


