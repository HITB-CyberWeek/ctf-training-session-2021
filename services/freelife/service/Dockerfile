FROM python:3.8-alpine

# Update the system & install pre-requisites
RUN apk update && apk add sqlite

# Create a user for the service
RUN addgroup -S freelife && adduser -S freelife -G freelife

# Move the service into the container
ADD freelife_service /home/freelife
RUN chown -R freelife:freelife /home/freelife

# Install django
WORKDIR /home/freelife
USER freelife

# TODO: Pin django to a safe version using requirements.txt
RUN pip install django 

# Run the service
EXPOSE 8000
CMD python manage.py runserver 0.0.0.0:8000
