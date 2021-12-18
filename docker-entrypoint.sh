#!/bin/bash

# Collect static files
#echo "Collect static files"
#python manage.py collectstatic --noinput
sleep 15
# Apply database migrations
echo "Apply database migrations"
echo $PWD
#this mv is a hack. I could not get git to put the code in the right place
echo "***"
ls /code
echo "***"
ls /code/code
echo "***"
ls /code/code/SDCode
echo "***"

python manage.py migrate

# create a superuser
export DJANGO_SUPERUSER_PASSWORD=gregncl
export DJANGO_SUPERUSER_USERNAME=greg
export DJANGO_SUPERUSER_EMAIL=greg@somewhere.ac.uk

python manage.py createsuperuser --noinput 

# Start server
echo "Starting server"

# python manage.py runserver 0.0.0.0:8000
