module NFT {
	use 0x1::Signer;
	use 0x1::Vector;

	const NFT_NUM: u8 = 100;
	const NFT_MARKET_HODL: adderss = "";

	struct NFT has key, store {
		id: u8,
		next_nft_id: u8,
		next_nft_owner: address,
		data: Art,
		sell_status: bool,
		price: u64,
	}

	struct Art has store {

	}

	public fun mint(account: &signer, coins: Token<STC>): NFT {

	}

	public fun transfer(account: &signer, coins: Token<STC>): NFT {
		// 确认 nft是出售的
		// 确认钱给够了
	}

	public fun start_selling(account: &signer, nft: NFT) {

	}

	public fun cancel_selling(account: &signer, nft: NFT) {

	}
}