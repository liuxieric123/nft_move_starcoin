module NFTExample1 {
    use 0x1::Signer;
    use 0x1::Vector;

    struct NFT has key, store { name: vector<u8> }

    struct UniqIdList has key, store {
        data: vector<vector<u8>>
    }

    public fun initialize(account: &signer) {
        move_to(account, UniqIdList {data: Vector::empty<vector<u8>>()});
    }

    public fun new(account: &signer, name: vector<u8>): NFT acquires UniqIdList {
        let account_address = Signer::address_of(account);
        let exist = Vector::contains<vector<u8>>(&borrow_global<UniqIdList>(account_address).data, &name);
        assert(!exist, 1);
        let id_list = borrow_global_mut<UniqIdList>(account_address);
        Vector::push_back<vector<u8>>(&mut id_list.data, copy name);
        NFT { name }
    }
}
}

address 0x2 {
module NFTExample2 {
    use 0x1::Signer;
    use 0x1::Vector;

    struct NFT<T: store> has key, store { name: T }

    struct UniqIdList<T: store> has key, store {
        data: vector<T>
    }

    public fun initialize(account: &signer) {
        move_to(account, UniqIdList {data: Vector::empty<vector<u8>>()});
    }

    public fun new(account: &signer, name: vector<u8>): NFT<vector<u8>> acquires UniqIdList {
        let account_address = Signer::address_of(account);
        let exist = Vector::contains<vector<u8>>(&borrow_global<UniqIdList<vector<u8>>>(account_address).data, &name);
        assert(!exist, 1);
        let id_list = borrow_global_mut<UniqIdList<vector<u8>>>(account_address);
        Vector::push_back<vector<u8>>(&mut id_list.data, copy name);
        NFT { name }
    }
}
}

address 0x2 {
module NFTExample4 {
    use 0x1::Vector;
    use 0x1::Event;

    struct NFT<T: store> has key, store { name: T }

    struct UniqIdList<T: store + drop> has key, store {
        data: vector<T>,
	nft_events: Event::EventHandle<NFTEvent<T>>,
    }

    struct NFTEvent<T: store + drop> has drop, store {
        name: T,
    }

    public fun initialize<T: store + drop>(account: &signer) {
        move_to(account, UniqIdList {data: Vector::empty<T>(), nft_events: Event::new_event_handle<NFTEvent<T>>(account)});
    }

    public fun new<T: store + copy + drop>(_account: &signer, account_address:address, name: T): NFT<T> acquires UniqIdList {
        let exist = Vector::contains<T>(&borrow_global<UniqIdList<T>>(account_address).data, &name);
        assert(!exist, 1);
        let id_list = borrow_global_mut<UniqIdList<T>>(account_address);
        Vector::push_back<T>(&mut id_list.data, copy name);
	let new_name = copy name;
        Event::emit_event(&mut id_list.nft_events, NFTEvent { name:new_name });
        NFT { name }
    }
}
}