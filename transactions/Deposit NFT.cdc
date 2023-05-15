import CryptoPoops from 0x01
import NonFungibleToken from 0x02

transaction (recipient:Address){
 prepare(acct: AuthAccount) {
let nftMinter = acct.borrow<&CryptoPoops.Minter>(from: /storage/Minter)!

let publicReference = getAccount(recipient).getCapability(/public/Collection)
            .borrow<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic}>()
            ??panic("This account dont have collection")


 publicReference.deposit(token:<- nftMinter.createNFT(name: "chakara", favouriteFood: "chakka", luckyNumber: 4))
 
 }

  execute {
    log("stored an  newly minted NFT")
  }
}
