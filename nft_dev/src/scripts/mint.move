script {
	use 0x4d72f898d7997e38b681b380a8c4c074::Market;
	use 0x1::Debug;

	fun main(account: signer, amount: u128) {
		Debug::print(&amount);
		Market::mint_nft(account, amount);
	}
}