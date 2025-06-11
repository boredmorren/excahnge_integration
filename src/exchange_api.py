from flask import Flask, jsonify 
import os, requests

APIKEY = os.environ.get('APIKEY')
app = Flask(__name__)
path = 'https://v6.exchangerate-api.com/v6/' + APIKEY

@app.route('/')
def index():
    return '''/get_latest'''

@app.route('/get_latest')
def get_latest():
    response = requests.get(path + '/latest/RUB').json()
    return jsonify(response)

def main():
    app.run()