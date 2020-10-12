FROM python:3.8-slim

ENV PYTHONUNBUFFERED True
ENV PORT 8080
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./

RUN pip install -r requirements.txt

EXPOSE 8080

CMD pip install -r requirements.txt
CMD python download_historical_prices.py
CMD python parsing_keystats.py
CMD python backtesting.py
CMD python current_data.py
CMD pytest -v
CMD python stock_prediction.py


