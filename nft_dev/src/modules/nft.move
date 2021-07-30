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

		struct NFT_INFO has store, drop {
			id: u8,
			next_nft_id: u8,
			next_nft_owner: address,
			data: Art,
			price: u128,
		}

		struct MARKET has key {
			head: address,
			cur_num: u8,
			min_price: u128,
			market_nft_info: vector<NFT_INFO>
		}

		public(script) fun init_market(account: signer) {
			let nFT_MARKET_HODL: address = @0x4d72f898d7997e38b681b380a8c4c074;
			let account_address = Signer::address_of(&account);
			assert(nFT_MARKET_HODL == account_address, 1);
			let market_info = MARKET {
				head: @0x0,
				cur_num: 1,
				min_price: 88000000000u128,
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
			Vector::push_back<NFT_INFO>(&mut market_detail.market_nft_info, back_info);
			market_detail.head = account_address;
			market_detail.cur_num = num + 1;
			if (num+1 > 10) {
				market_detail.min_price = 388000000000u128;
			} else if (num+1 > 50) {
				market_detail.min_price = 688000000000u128;
			} else if (num+1 > 90) {
				market_detail.min_price = 1088000000000u128;
			}
		}

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
			Vector::push_back<u64>(&mut param_2_darkness, 75);
			Vector::push_back<u64>(&mut param_2_darkness, 100);
			Vector::push_back<u64>(&mut param_2_darkness, 500);
			Vector::push_back<u64>(&mut param_2_darkness, 700);
			Vector::push_back<u64>(&mut param_2_darkness, 1000);
			Vector::push_back<u64>(&mut param_2_darkness, 1800);
			Vector::push_back<u64>(&mut param_2_darkness, 2500);
			Vector::push_back<u64>(&mut param_2_scale, 60);
			Vector::push_back<u64>(&mut param_2_scale, 190);
			Vector::push_back<u64>(&mut param_2_scale, 400);
			Vector::push_back<u64>(&mut param_2_scale, 680);
			Vector::push_back<u64>(&mut param_2_scale, 800);
			Vector::push_back<u64>(&mut param_2_persistence, 3);
			Vector::push_back<u64>(&mut param_2_persistence, 4);
			Vector::push_back<u64>(&mut param_2_persistence, 5);
			Vector::push_back<u64>(&mut param_2_intensity, 6);
			Vector::push_back<u64>(&mut param_2_intensity, 13);
			Vector::push_back<u64>(&mut param_2_intensity, 17);
			Vector::push_back<u64>(&mut param_2_intensity, 30);
			let mod_3:u64 = (num as u64) % 3;
			let mod_4:u64 = (num as u64) % 4;
			let mod_5:u64 = (num as u64) % 5;
			let mod_6:u64 = (num as u64) % 6;
			let mod_7:u64 = (num as u64) % 7;
			Vector::push_back<u64>(&mut param_1_list, *Vector::borrow<u64>(&param_1_cell_size, mod_6));
			Vector::push_back<u64>(&mut param_1_list, *Vector::borrow<u64>(&param_1_noise_size, mod_5));
			Vector::push_back<u64>(&mut param_1_list, *Vector::borrow<u64>(&param_1_noise_radius, mod_4));
			Vector::push_back<u64>(&mut param_2_list, *Vector::borrow<u64>(&param_2_darkness, mod_7));
			Vector::push_back<u64>(&mut param_2_list, *Vector::borrow<u64>(&param_2_scale, mod_5));
			Vector::push_back<u64>(&mut param_2_list, *Vector::borrow<u64>(&param_2_persistence, mod_3));
			Vector::push_back<u64>(&mut param_2_list, *Vector::borrow<u64>(&param_2_intensity, mod_4));
			Art {prob_a: prob_a, prob_b: prob_b, param_1: param_1_list, param_2: param_2_list}
		}
	}
}