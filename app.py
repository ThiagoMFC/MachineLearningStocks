from flask import Flask
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import precision_score
from utils import status_calc
from sklearn.ensemble import RandomForestClassifier
from utils import data_string_to_float, status_calc
from backtesting import backtest

app = Flask(__name__)


@app.route('/', methods=['GET'])
def hello():
    return f'Hello you should use an other route:!\nEX: get_stock_val/<ticker>\n'


@app.route('/perf', methods=['GET'])
def get_stock_value():
    text = backtest()
    return text

if __name__ == '__main__':
    # Used when running locally only. When deploying to Cloud Run,
    # a webserver process such as Gunicorn will serve the app.
    app.run(host='localhost', port=8080, debug=True)