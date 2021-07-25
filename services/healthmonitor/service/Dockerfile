FROM golang:alpine

# Update the system & install pre-requisites
RUN apk update && apk add sqlite build-base gcc

# Create a user for the service
RUN addgroup -S healthmonitor && adduser -S healthmonitor -G healthmonitor

# Move the service into the container
ADD healthmonitor_service /home/healthmonitor
RUN chown -R healthmonitor:healthmonitor /home/healthmonitor


# Compile the service
WORKDIR /home/healthmonitor/server
USER healthmonitor
RUN go mod init github.com/HITB-CyberWeek/ctf-training-session-2021/healthmonitor && \
    go mod tidy && \
    go build -v

# Run the service
EXPOSE 8000
CMD ./healthmonitor
