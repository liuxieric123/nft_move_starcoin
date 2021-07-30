import sys
import os
sys.path.append(os.path.dirname(os.path.dirname(os.path.dirname(__file__))))
from flask import Flask, abort, request, make_response, url_for, redirect
from flask_caching import Cache
from cache import get_chain_nft_market, get_owner_nft_info
from probability import world
from flask_cors import CORS

cache = Cache(config={'CACHE_TYPE': 'SimpleCache'})
app = Flask(__name__, static_url_path='', static_folder='dist')
cache.init_app(app)
CORS(app)

@app.route('/', methods=['GET'])
def index():
    return redirect(url_for('static', filename='index.html'))

@app.route('/get_nft_market', methods=['GET'])
@cache.memoize()
def get_nft_market():
	return get_chain_nft_market() 

@app.route('/get_nft_image', methods=['POST'])
def get_nft_image():
	body = request.json['params']
	# return body, 200
	return world(int(body['a']), int(body['b'])), 200

@app.route('/get_owner_nft', methods=['GET'])
def get_owner_nft():
	address = request.args.get('ownerAddress', None)
	if address is None:
		return [], 200
	return get_owner_nft_info(address), 200


@app.route('/update_cache', methods=['GET'])
def update_cache():
	try:
		cache.delete_memoized(get_nft_image)
		return "updated!", 200
	except:
		abort(500)


if __name__ == "__main__":
    app.run(host='0.0.0.0', port='37799', debug=True)