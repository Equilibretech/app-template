# Build stage
FROM golang:1.21-alpine AS builder

# Install build dependencies
RUN apk add --no-cache git ca-certificates

WORKDIR /app

# Copy go mod files
COPY go.mod go.sum* ./

# Download dependencies
RUN go mod download

# Copy source code
COPY src/ ./src/

# Build the application
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build \
    -ldflags="-w -s -X main.version=1.0.0" \
    -o /app/service ./src/...

# Production stage
FROM scratch

# Copy CA certificates for HTTPS
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

# Copy the binary
COPY --from=builder /app/service /service

# Expose port (adjust if needed)
EXPOSE 8080

# Run the binary
ENTRYPOINT ["/service"]

# Note: Health check needs to be implemented in Go code or use a minimal image with shell
# For scratch image, implement health endpoint in your Go application

# Labels
LABEL service="{{ cookiecutter.service_slug }}" \
      version="1.0.0" \
      maintainer="Equilibretech"