address 0x4d72f898d7997e38b681b380a8c4c074 {
	module NFT_MODULE {
		use 0x1::Signer;
		use 0x1::Vector;
		use 0x1::STC::STC;
		use 0x1::Account;

		const NFT_NUM: u8 = 100;
		
		struct NFT has store {
			id: u8,
			next_nft_id: u8,
			next_nft_owner: address,
			data: Art,
			sell_status: bool,
			price: u128,
		}

		struct Art has store, copy, drop {
			prob_a: u8,
			prob_b: u8,
			param_1: vector<u64>,
			param_2: vector<u64>

		}

		struct UniqList has key {
			data: vector<NFT>
		}

		struct NFT_INFO has drop {
			id: u8,
			next_nft_id: u8,
			next_nft_owner: address,
			data: Art,
			price: u128,
		}

		struct MARKET has key {
			head: address,
			cur_num: u8,
			min_price: u128
			market_nft_info: vector<NFT_INFO>
		}

		public(script) fun init_market(account: signer) {
			let nFT_MARKET_HODL: address = @0x4d72f898d7997e38b681b380a8c4c074;
			let account_address = Signer::address_of(&account);
			assert(nFT_MARKET_HODL == account_address, 1);
			let market_info = MARKET {
				head: @0x0,
				cur_num: 1,
				min_price: 288000000000u128,
				market_nft_info: Vector::empty<NFT_INFO>()
			};
			move_to<MARKET>(&account, market_info);
		}

		public(script) fun mint(account: signer, amount: u128) acquires UniqList, MARKET{
			let nFT_MARKET_HODL: address = @0x4d72f898d7997e38b681b380a8c4c074;
			let num = borrow_global<MARKET>(nFT_MARKET_HODL).cur_num;
			let min_price = borrow_global<MARKET>(nFT_MARKET_HODL).min_price;
			let head = borrow_global<MARKET>(nFT_MARKET_HODL).head;
			assert(num <= NFT_NUM, 1);
			assert(amount >= min_price, 1);
			// get signer's address
			let account_address = Signer::address_of(&account);
			// create art piece
			let art_piece = draw(num);
			// create NFT
			Account::pay_from<STC>(&account, nFT_MARKET_HODL, amount);
			let art_piece_copy = copy art_piece;
			let nft = NFT {
				id: num,
				next_nft_id: num-1,
				next_nft_owner: head,
				data: art_piece_copy,
				sell_status: false,
				price: amount // coin value
			};
			// return nft_info
			let art_piece_copy = copy art_piece;
			let back_info = NFT_INFO {
				id: nft.id,
				next_nft_id: nft.next_nft_id,
				next_nft_owner: nft.next_nft_owner,
				data: art_piece_copy,
				price: nft.price
			};
			if (!exists<UniqList>(account_address)) {
				move_to(&account, UniqList {data: Vector::empty<NFT>()})
			};
			let owner_uniqList = move_from<UniqList>(account_address);
			Vector::push_back<NFT>(&mut owner_uniqList.data, nft);
			move_to<UniqList>(&account, owner_uniqList);
			let market_detail = borrow_global_mut<MARKET>(nFT_MARKET_HODL);
			Vector::push_back<NFT_INFO>(market_detail, back_info);
			market_detail.head = account_address;
			market_detail.cur_num = num + 1;
		}

		// public fun transfer(account: &signer, nft_id: u8, amount: u128): NFT {
		// 	// check nft is for sale
		// 	// check paid enough
		// }

		// public fun start_selling(account: &signer, nft_id: u8, price: u8) {
		// 	// check account has uniqList
		// 	// check uniqList has nft_id
		// 	// modify nft owner info 
		// }

		// public fun cancel_selling(account: &signer, nft: NFT) {
		// 	// check account has uniqList
		// 	// check uniqList has nft_id
		// 	// modify nft params 
		// }

		fun draw(num: u8): Art {
			let prob_a = (num + 13) % 100;
			let prob_b = 100 - prob_a;
			// generate params for art piece
			let param_1_list = Vector::empty<u64>();
			let param_2_list = Vector::empty<u64>();
			let param_1_cell_size = Vector::empty<u64>();
			let param_1_noise_size = Vector::empty<u64>();
			let param_1_noise_radius = Vector::empty<u64>();
			let param_2_darkness = Vector::empty<u64>();
			let param_2_scale = Vector::empty<u64>();
			let param_2_persistence = Vector::empty<u64>();
			let param_2_intensity = Vector::empty<u64>();
			Vector::push_back<u64>(&mut param_1_cell_size, 5);
			Vector::push_back<u64>(&mut param_1_cell_size, 10);
			Vector::push_back<u64>(&mut param_1_cell_size, 15);
			Vector::push_back<u64>(&mut param_1_cell_size, 25);
			Vector::push_back<u64>(&mut param_1_cell_size, 50);
			Vector::push_back<u64>(&mut param_1_cell_size, 150);
			Vector::push_back<u64>(&mut param_1_noise_size, 1);
			Vector::push_back<u64>(&mut param_1_noise_size, 10);
			Vector::push_back<u64>(&mut param_1_noise_size, 100);
			Vector::push_back<u64>(&mut param_1_noise_size, 1000);
			Vector::push_back<u64>(&mut param_1_noise_size, 10000);
			Vector::push_back<u64>(&mut param_1_noise_radius, 1);
			Vector::push_back<u64>(&mut param_1_noise_radius, 10);
			Vector::push_back<u64>(&mut param_1_noise_radius, 30);
			Vector::push_back<u64>(&mut param_1_noise_radius, 100);
			Vector::push_back<u64>(&mut param_2_darkness, 5);
			Vector::push_back<u64>(&mut param_2_darkness, 10);
			Vector::push_back<u64>(&mut param_2_darkness, 50);
			Vector::push_back<u64>(&mut param_2_darkness, 100);
			Vector::push_back<u64>(&mut param_2_darkness, 250);
			Vector::push_back<u64>(&mut param_2_scale, 30);
			Vector::push_back<u64>(&mut param_2_scale, 150);
			Vector::push_back<u64>(&mut param_2_scale, 350);
			Vector::push_back<u64>(&mut param_2_scale, 600);
			Vector::push_back<u64>(&mut param_2_scale, 1100);
			Vector::push_back<u64>(&mut param_2_persistence, 1);
			Vector::push_back<u64>(&mut param_2_persistence, 3);
			Vector::push_back<u64>(&mut param_2_persistence, 6);
			Vector::push_back<u64>(&mut param_2_intensity, 1);
			Vector::push_back<u64>(&mut param_2_intensity, 5);
			Vector::push_back<u64>(&mut param_2_intensity, 10);
			Vector::push_back<u64>(&mut param_2_intensity, 30);
			let mod_3:u64 = (num as u64) % 3;
			let mod_4:u64 = (num as u64) % 4;
			let mod_5:u64 = (num as u64) % 5;
			let mod_6:u64 = (num as u64) % 6;
			Vector::push_back<u64>(&mut param_1_list, *Vector::borrow<u64>(&param_1_cell_size, mod_6));
			Vector::push_back<u64>(&mut param_1_list, *Vector::borrow<u64>(&param_1_noise_size, mod_5));
			Vector::push_back<u64>(&mut param_1_list, *Vector::borrow<u64>(&param_1_noise_radius, mod_4));
			Vector::push_back<u64>(&mut param_2_list, *Vector::borrow<u64>(&param_2_darkness, mod_5));
			Vector::push_back<u64>(&mut param_2_list, *Vector::borrow<u64>(&param_2_scale, mod_5));
			Vector::push_back<u64>(&mut param_2_list, *Vector::borrow<u64>(&param_2_persistence, mod_3));
			Vector::push_back<u64>(&mut param_2_list, *Vector::borrow<u64>(&param_2_intensity, mod_4));
			Art {prob_a: prob_a, prob_b: prob_b, param_1: param_1_list, param_2: param_2_list}
		}

	// 	fun get_nft_list(head: address, cur_num: u8, start: u8, end: u8): vector<NFT_INFO> acquires UniqList {
	// 		let nft_info_vector = Vector::empty<NFT_INFO>();
	// 		if (cur_num < start || start > end) {
	// 			abort 1
	// 		};
	// 		while (true) {
	// 			// find end position's nft first
	// 			while (cur_num > end) {
	// 				let owner_uniqList = borrow_global<UniqList>(head);
	// 				let length = Vector::length<NFT>(&owner_uniqList.data);
	// 				let i:u64 = 0;
	// 				while (i < length) {
	// 					if (cur_num == Vector::borrow<NFT>(&owner_uniqList.data, i).id) {
	// 						head = Vector::borrow<NFT>(&owner_uniqList.data, i).next_nft_owner;
	// 						cur_num = cur_num - 1;
	// 						break
	// 					} else {
	// 						i = i + 1;
	// 						continue
	// 					}
	// 				};
	// 			};
	// 			while (cur_num >= start && cur_num > 0) {
	// 				let owner_uniqList = borrow_global<UniqList>(head);
	// 				let length = Vector::length<NFT>(&owner_uniqList.data);
	// 				let i:u64 = 0;
	// 				while (i < length) {
	// 					if (cur_num == Vector::borrow<NFT>(&owner_uniqList.data, i).id) {
	// 						head = Vector::borrow<NFT>(&owner_uniqList.data, i).next_nft_owner;
	// 						cur_num = cur_num - 1;
	// 						let nft_info = nft_to_info(Vector::borrow<NFT>(&owner_uniqList.data, i));
	// 						Vector::push_back<NFT_INFO>(&mut nft_info_vector, nft_info);
	// 						break
	// 					} else {
	// 						i = i + 1;
	// 						continue
	// 					}
	// 				};
	// 			};
	// 		};
	// 		nft_info_vector
	// 	}
		
	// 	public(script) fun get_owner_nft_list(account: address): vector<NFT_INFO> acquires UniqList {
	// 		let owner_uniqList = borrow_global<UniqList>(account);
	// 		let length = Vector::length<NFT>(&owner_uniqList.data);
	// 		let i:u64 = 0;
	// 		let nft_info_vector = Vector::empty<NFT_INFO>();
	// 		while (i < length) {
	// 			let nft_info = nft_to_info(Vector::borrow<NFT>(&owner_uniqList.data, i));
	// 			Vector::push_back<NFT_INFO>(&mut nft_info_vector, nft_info);
	// 			i = i + 1;	
	// 		};
	// 		nft_info_vector
	// 	}
		
	// 	fun nft_to_info(nft: &NFT): NFT_INFO {
	// 		let art_piece = *&nft.data;
	// 		NFT_INFO {
	// 			id: nft.id,
	// 			next_nft_id: nft.next_nft_id,
	// 			next_nft_owner: nft.next_nft_owner,
	// 			data: art_piece,
	// 			price: nft.price
	// 		}
	// 	}
	// }
}