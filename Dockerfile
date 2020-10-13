#FROM python:3.8-slim
FROM continuumio/miniconda3
ENV PYTHONUNBUFFERED True
#ENV PORT 8080
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./

RUN pip install -r requirements.txt

#EXPOSE 8080

#CMD python download_historical_prices.py
#CMD python parsing_keystats.py
#CMD python current_data.py
#CMD python stock_prediction.py
#CMD python app.py




RUN pip install Flask gunicorn

# Service must listen to $PORT environment variable.
# This default value facilitates local development.
ENV PORT 8080
# Run the web service on container startup. Here we use the gunicorn
# webserver, with one worker process and 8 threads.
# For environments with multiple CPU cores, increase the number of workers
# to be equal to the cores available.
CMD exec gunicorn --bind 0.0.0.0:$PORT --workers 1 --threads 8 --timeout 0 app:app




