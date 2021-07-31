import requests

# url = "http://localhost:9850"
url = "https://barnard-seed.starcoin.org"
# url = "https://main-seed.starcoin.org"
def get_chain_nft_market():

	payload={
		"id":101, 
		"jsonrpc":"2.0", 
		"method":"state.get_resource", 
		"params":["0x5E3596E11C09Fb16790E8310D8e3bfF1", "0x5E3596E11C09Fb16790E8310D8e3bfF1::NFT_MODULES::MARKET", {"decode": True}]
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
		"params":[address, "0x5E3596E11C09Fb16790E8310D8e3bfF1::NFT_MODULES::UniqList", {"decode": True}]
	}

	headers = {
		'Content-Type': 'application/json'
	}

	response = requests.request("POST", url, headers=headers, json=payload)
	return response.content

if __name__ == "__main__":
	print(get_chain_nft_market())
