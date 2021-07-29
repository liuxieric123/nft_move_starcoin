address 0x4d72f898d7997e38b681b380a8c4c074 {
	module Market {
		use 0x4d72f898d7997e38b681b380a8c4c074::NFT_MODULE;
		use 0x1::Signer;
		// initialize market, nft price set and so on
		struct MARKET has key, copy {
			head: address,
			cur_num: u8,
			min_price: u128
		}

		struct MARKET_NFT_INFO has copy, drop, store{
			data: u64
		}

		public(script) fun init_market(account: signer) {
			let nFT_MARKET_HODL: address = @0x4d72f898d7997e38b681b380a8c4c074;
			let account_address = Signer::address_of(&account);
			assert(nFT_MARKET_HODL == account_address, 1);
			let market_info = MARKET {
				head: @0x0,
				cur_num: 1,
				min_price: 288u128
			};
			move_to<MARKET>(&account, market_info);
		}

		public(script) fun get_nft_list(start: u8, end: u8): vector<NFT_MODULE::NFT_INFO> acquires MARKET {
			// get nft list by specify start and end position
			let nFT_MARKET_HODL: address = @0x4d72f898d7997e38b681b380a8c4c074;
			let market_detail = borrow_global_mut<MARKET>(nFT_MARKET_HODL);
			let head = market_detail.head;
			let cur_num = market_detail.cur_num;
			NFT_MODULE::get_nft_list(head, cur_num, start, end)
		}

		public(script) fun get_owner_nft_list(): vector<NFT_MODULE::NFT_INFO> acquires MARKET {
			// get owner nft list
			let nFT_MARKET_HODL: address = @0x4d72f898d7997e38b681b380a8c4c074;
			let market_detail = borrow_global<MARKET>(nFT_MARKET_HODL);
			let head = market_detail.head;
			NFT_MODULE::get_owner_nft_list(head)
		}

		public(script) fun mint_nft(account: signer, amount: u128) acquires MARKET{
			// call mint nft
			let nFT_MARKET_HODL: address = @0x4d72f898d7997e38b681b380a8c4c074;
			let cur_num = borrow_global<MARKET>(nFT_MARKET_HODL).cur_num;
			let head_address = borrow_global<MARKET>(nFT_MARKET_HODL).head;
			let min_price = borrow_global<MARKET>(nFT_MARKET_HODL).min_price;
			let account_address = Signer::address_of(&account);
			// may be fail due to nft module
			let _ = NFT_MODULE::mint(account, cur_num, amount, head_address, min_price);
			let market_detail = borrow_global_mut<MARKET>(nFT_MARKET_HODL);
			market_detail.head = account_address;
			market_detail.cur_num = cur_num + 1;
		}
	}
}