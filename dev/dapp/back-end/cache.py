import requests

def get_chain_nft_market():

	url = "http://localhost:9850"
	# url = "https://barnard-seed.starcoin.org"

	payload={
		"id":101, 
		"jsonrpc":"2.0", 
		"method":"state.get_resource", 
		"params":["0x4d72f898d7997e38b681b380a8c4c074", "0x4d72f898d7997e38b681b380a8c4c074::NFT_MODULE::MARKET", {"decode": True}]
	}

	headers = {
		'Content-Type': 'application/json'
	}

	response = requests.request("POST", url, headers=headers, json=payload)
	return response.content

if __name__ == "__main__":
	print(get_chain_nft_market())
