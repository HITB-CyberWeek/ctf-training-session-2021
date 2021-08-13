FROM golang:alpine

# Update the system & install pre-requisites
RUN apk update && apk add sqlite build-base gcc

# Move the service into the container
ADD healthmonitor_service /home/healthmonitor

# Compile the service
WORKDIR /home/healthmonitor/server
RUN go mod init github.com/HITB-CyberWeek/ctf-training-session-2021/healthmonitor && \
    go mod tidy && \
    go build -v

# Run the service
EXPOSE 8080
CMD ./healthmonitor
