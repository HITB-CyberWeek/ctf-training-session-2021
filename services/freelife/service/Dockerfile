FROM python:3.8-alpine

# Update the system & install pre-requisites
RUN apk update && apk add sqlite

# Move the service into the container
ADD freelife_service /home/freelife

# Install django
WORKDIR /home/freelife

# TODO: Pin django to a safe version using requirements.txt
RUN pip install django 

# Run the service
EXPOSE 8000
CMD /bin/sh -c "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"
