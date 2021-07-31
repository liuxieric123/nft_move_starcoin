import axios from 'axios'


const baseUrl = 'http://pa.memex.studio'
// const baseUrl = "http://0.0.0.0:37799"
const url = {
    getNFTMarket: baseUrl + '/get_nft_market',
    getOwnerNFT: baseUrl + '/get_owner_nft',
	getNFTImage: baseUrl + '/get_nft_image',
    updateCache: baseUrl + '/update_cache'
}

const instance = axios.create()

const getNFTMarket = () => instance.get(url.getNFTMarket).then(function(response) {
	if (response.status == 200) {
		try {
			console.log(response)
			return response.data.result.json
		} catch {
			return []
		}
	} else {
		return []
	}
})
const getOwnerNFT = (ownerAddress='') => instance.get(url.getOwnerNFT, {params: {
    ownerAddress: ownerAddress
}}).then(function(response) {
	if (response.status == 200) {
		return response.data.result.json.data
	} else {
		return []
	}
})
const getNFTImage = (a='', b='') => instance.post(url.getNFTImage, {params: {
	"a": a,
	"b": b
}})
const updateCache = () => instance.get(url.updateCache)

export default {
	getNFTMarket,
	getOwnerNFT,
	getNFTImage,
	updateCache
}

