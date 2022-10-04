from flask import Flask, jsonify, render_template
import socket

app = Flask(__name__)


@app.route("/")
def hello_world():
    return "hello world"


@app.route("/healthcheck")
def check_health():
    return jsonify(status='UP')


def fetch_details():
    hostname = socket.gethostname()
    host_ip = socket.gethostbyname(hostname)
    return str(hostname), str(host_ip)


@app.route("/details")
def check_details():
    hostname, ip = fetch_details()

    return render_template("index.html", hostname=hostname, ip=ip)


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
