## 调研文档
### 目标

在 starcoin 公链上发布一个 nft代币，面向艺术品，可以进行拍卖。

### 需求分解

如果面向的是画作，需要电子化，电子化后的文件需要进行存储。nft 得到是一个识别吗，而不能表示文件，所以需要将识别码与文件进行映射。

为了达到去中心化的目的（画作不能被篡改，一经发行就被公开共识了），可以考虑将文件存储在去中心化的存储上（ipfs?)

如何进行定价？

如何进行拍卖？

如何确定交易？

经过调研其他的 nft 交易网站，发现要实现一个完整的交易平台比较复杂，涉及到对接创作者，上传作品，作品鉴权的问题。

在有限的时间下，暂时先不考虑做一个交易所。

考虑实现有限作品的交易，拍卖。

确认一下实现：

> 1. 允许发起以此荷兰式拍卖
> 	给定初始化价格
> 	给定变化周期
> 	给定保留价格（底价）
> 	可以取消拍卖
> 2. 只允许特定的地址发起铸造 nft
> 3. 允许转卖
>	给定报价
>	可以取消
> 4. 版税 nft
> 	交易则返程给创作者

### 实现路径
#### 从 eth 的 eip-721 实现学习实现逻辑，然后翻译到 move

https://eips.ethereum.org/EIPS/eip-721
https://github.com/leohio/LibraNFT/blob/master/erc721.mvir

#### ipfs api 可以通过 infura 进行实现

https://infura.io/product/ipfs

如果是自己启动 ipfs节点的话有点麻烦，通过 infura，可以方便的进行存储，缺点是依赖于中心话的 infura，优点是把一些杂乱的工作交给了别人

#### 前端与 starcoin 链（合约）的交互可以通过 starcoin sdk(npm) 实现

前端需要获得钱包的授权，前端的函数调用钱包（starmask)

#### starcoin 上 dapp，与 metaMask 交互的来虫子
https://starmask-test-dapp.starcoin.org/

### nft 荷兰式拍卖
什么是荷兰式拍卖？我们了解的大多数拍卖都属于英格兰式拍卖，也叫增价拍卖，竞买人不断出高价。荷兰式拍卖式拍卖人给定一个起始价格，然后以一定降幅报价，直至有人应价，一般会有一个保留价格。

> https://github.com/ssteiger/Ethereum-NFT-Store-with-Dutch-Auctions

一个以太坊 nft，荷兰拍卖的例子

### 与艺术家的合作
光有平台（工具）是不够的，关键是能够为社会提供什么价值。可以尝试与艺术家进行合作，这个工具可以提供的：
1. 公平的市场
2. 可靠的版权
3. 给艺术家带去曝光与流量
4. 可以为艺术家提供接触区块链、nft的场景，作为他们的实验场所