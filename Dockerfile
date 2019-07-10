#base image
FROM python:3.7

# Copy the application folder inside the container
ADD . /testDjango/app
# set the default directory where CMD will execute
WORKDIR /testDjango/app

# Get pip to download and install requirements:
RUN pip3 install --no-cache-dir -r requirements.txt
# Expose ports
EXPOSE 8000
# default command to execute    
CMD exec gunicorn djangoapp.wsgi:application --bind 0.0.0.0:8000 --workers 3
