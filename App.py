from flask import Flask, request, jsonify
import json

app = Flask(__name__)
FILE = "keys.json"

def load():
    with open(FILE) as f:
        return json.load(f)

def save(d):
    with open(FILE,"w") as f:
        json.dump(d,f,indent=4)

@app.route("/check")
def check():
    key = request.args.get("key")
    hwid = request.args.get("hwid")

    data = load()
    if key in data:
        if data[key]["hwid"] in [None, hwid]:
            data[key]["hwid"] = hwid
            save(data)
            return jsonify({"ok": True})
    return jsonify({"ok": False})

app.run(host="0.0.0.0", port=8080)
