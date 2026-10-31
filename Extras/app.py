import io
import requests
from flask import Flask, request, jsonify
from PIL import Image

app = Flask(__name__)

MAX_DOWNLOAD = 15 * 1024 * 1024
MAX_RES = 320


@app.route("/")
def convert():
    url = request.args.get("URL", "")
    if not url.startswith(("http://", "https://")):
        return jsonify(error="invalid url"), 400

    try:
        sx = max(1, min(int(request.args.get("SizeX", 64)), MAX_RES))
        sy = max(1, min(int(request.args.get("SizeY", 64)), MAX_RES))
    except ValueError:
        return jsonify(error="invalid size"), 400

    try:
        r = requests.get(url, timeout=15, stream=True,
                         headers={"User-Agent": "Mozilla/5.0"})
        r.raise_for_status()
        data = r.raw.read(MAX_DOWNLOAD + 1, decode_content=True)
        if len(data) > MAX_DOWNLOAD:
            return jsonify(error="image too large"), 413
        img = Image.open(io.BytesIO(data)).convert("RGBA")
    except Exception as e:
        return jsonify(error=str(e)), 400

    img = img.resize((sx, sy), Image.LANCZOS)
    pixels = [list(p) for p in img.getdata()]
    return jsonify(Data=pixels, Size=[sx, sy])


@app.route("/health")
def health():
    return "ok"
