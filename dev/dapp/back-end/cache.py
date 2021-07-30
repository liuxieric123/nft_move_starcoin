import requests

url = "http://localhost:9850"
def get_chain_nft_market():

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

def get_owner_nft_info(address):
	print(type(address))
	payload={
		"id":101, 
		"jsonrpc":"2.0", 
		"method":"state.get_resource", 
		"params":[address, "0x4d72f898d7997e38b681b380a8c4c074::NFT_MODULE::UniqList", {"decode": True}]
	}

	headers = {
		'Content-Type': 'application/json'
	}

	response = requests.request("POST", url, headers=headers, json=payload)
	return response.content

if __name__ == "__main__":
	print(get_chain_nft_market())
