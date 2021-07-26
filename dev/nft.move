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

module Auction {
    use 0x1::Errors;
    use 0x1::Libra::Libra;
    use 0x1::LibraAccount;
    use 0x1::Signer;

    // Published under the auctioneer's account
    // ToSell is the type of the value to be auctioned.
    // It can be defined in another module (e.g., NonFungibleToken.move)
    // Currency is the type of coin the beneficiary would like to receive
    resource struct Auction<ToSell,Currency> {
        to_sell: ToSell, // the value to be aucitioned
        beneficiary: address, // address that will receive proceeds from the auction
        max_bid: u64,
        // ... fields for min_bid, the end time of the auction, etc.
    }

    // A bid resource granted to someone who bids `bid` coins for the
    // resource ToSell being auctioned at auction_addr
    resource struct Bid<ToSell,Currency> {
        bid: Libra<Currency>,
        auction_addr: address
    }

    const EBID_TOO_SMALL: u64 = 0;

    public fun create<ToSell,Currency>(auctioneer: &signer, beneficiary: address, to_sell: ToSell) {
        move_to<Auction<ToSell,Currency>>(auctioneer, Auction<ToSell> { to_sell, beneficiary, max_bid: 0 })
    }

    public fun bid<ToSell,Currency>(
        bidder: &signer, auction_addr: address, bid: Libra<Currency>
    ) acquires Auction {
        let bid_amount = Libra::value(&bid);
        // retrieve the Auction resource at addr and update the max bid
        let old_max_bid = borrow_global_mut<Auction<ToSell,Currency>>(auction_addr).max_bid;
        if bid_amount > old_max_bid {
            // new max bid; update auction resource and publish the bid under the bidder's account
            *old_max_bid = bid_amount;
            move_to(bidder, Bid<ToSell,Currency> { bid, auction_addr });
        } else {
            // this bid is not going to win the auction; abort
            abort(Errors::invalid_state(EBID_TOO_SMALL))
        }
    }

    // if this is the winning bid, give the funds to the auctioneer and the ToSell to the bidder
    public fun redeem_winning_bid<ToSell,Currency>(bidder: &account): ToSell acquires Auction, Bid {
        let Bid { bid, auction_addr } = move_from<Bid<ToSell,Currency>>(Signer::address_of(bidder));
        let Auction { to_sell, beneficiary, max_bid } = move_from<Auction<ToSell,Currency>>(auction_addr);
        // ... we would want to check that the Auction is over here. we'll assume it for simplicity
        // make sure this is actually the winning bid!
        assert(Libra::value(&bid) == max_bid, Errors::invalid_state(EBID_TOO_SMALL));
        // give the beneficiary the funds
        LibraAccount::deposit(bid, auction_addr);

        to_sell
    }

    // ... procedures to refund non-winning bids, re-bid, etc.
}