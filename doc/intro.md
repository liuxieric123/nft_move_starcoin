# 视频制作大纲

## 项目总体性介绍
P(A) ，中文含义是艺术的全概率，是一个基于SRARCOIN区块链，使用 move 语言开发、发行、收集和交易NFT独立艺术项目的平台。


## 作品展示
- 这部分主要是展示作品、操作以及需要被提及的细节，包括主页的交互样式，铸造页的入口，铸造页结构，如何铸造（连接钱包铸造），作品铸造完成后的显示特性（会随机展示不同的图像，展示机率不是完全相同的，是被一个贝塔分布定义的）；再展示 about页面，这个页面主要是讲述项目理念以及一些 Q&A，memex^2 是团队介绍


## 项目理念阐述
- 
- 这是一个加密艺术项目，不同于大多数加密艺术项目创作作品，再通过铸造 nft 进行售卖的方式。我们的项目通过预先确定好的由点、线基本元素的生成艺术作为图像生成方式，图像生成参数保存在智能合约中，nft 一旦铸造，作品也就被相应确定。可以说
作品是保存在区块链中的（这个地方可以画一个图像生成器，一端输入参数，另一端输出图像）
- 我们通过给每组作品设定 贝塔分布，以确定不同图像的展示比例。保存在区块链中的参数是不可被篡改的，参数唯一确定了作品，互联网层数字资产会根据概率参数计算确定以何种图像展示，通过这种手段表达在互联层数字资产有被篡改的可能，包括不同的图像展示比例，可以说随机性本身也是该艺术作品的一部分。

## 技术细节
- 这个地方可以先画一个简单的架构图（区块链层、互联网层、用户层）
- 根据功能一一讲述各个层之间的关系，以及使用何种技术进行实现