module testnetnft::testnet_twitter_profile {
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};
    use sui::url::{Self, Url};
    use std::string::{Self, String};
    use sui::transfer;
    public struct MyNFT has key, store {
        id: UID,
        name: String,
        description: String,
        url: Url,
    }
    public fun mint_to_sender(
        name_bytes: vector<u8>,
        description_bytes: vector<u8>,
        ctx: &mut TxContext,
    ) {
        let sender = tx_context::sender(ctx);
        let nft = MyNFT {
            id: object::new(ctx),
            name: string::utf8(name_bytes),
            description: string::utf8(description_bytes),
            url: url::new_unsafe_from_bytes(b"https://pbs.twimg.com/profile_images/1925051658087862272/DNxDvuxN_400x400.jpg"),
        };

        // 将 NFT 转移给发送者
        transfer::public_transfer(nft, sender);
    }
}

// 0xec0003a9159c817cc1b7df3ee86b95ea8c0309c8f9c0ffcf7803a8ce62fbe71d