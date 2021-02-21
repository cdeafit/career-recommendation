import plotly
import plotly.graph_objs as go
import pandas as pd
import numpy as np
import json
from flask import (
    Flask,
    render_template,
    send_file,
    request,
    redirect,
    url_for)


app = Flask(__name__)


@app.route('/')
def index():
    return render_template('ej.html', graphicData="", data=None)


@app.route('/', methods=['POST', 'GET'])
def index_img():
    if request.method == 'POST':
        return render_template(
            'ej.html',
            graphicData=create_plot(request.form),
            data=request.form)
    else:
        return render_template('ej.html', url="")


def create_plot(data):
    carreras = [
        'ingeniería', 'política', 'veterinaria',
        'ulinaria', 'teología', 'jueguitos',
        'sociología', 'música'
    ]
    data = [
        go.Bar(y=carreras, x=list(data.values()), orientation='h')
    ]

    graphJSON = json.dumps(data, cls=plotly.utils.PlotlyJSONEncoder)

    return graphJSON


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0")
