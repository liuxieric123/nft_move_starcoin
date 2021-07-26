script {
	use 0x4d72f898d7997e38b681b380a8c4c074::Market;

	fun main(account: signer) {
		Market::init_market(account);
	}
}