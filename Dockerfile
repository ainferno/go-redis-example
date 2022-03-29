FROM golang:1.18

# Setup working directory
WORKDIR /app

# Copy and download dependencies
COPY go.mod .
COPY go.sum .
RUN go mod download

# Copy the code into the container
COPY . .

# Build the application
RUN go build -o main .

# Export port
EXPOSE 8080

# Command to run when starting the container
CMD ["./main"]