<template>
	<div class='container'>
		<div class="head" >
			<div class='reverse'>
			<div class="animate-reverse">
			<div class="head-unit" v-for="item in 4" :key="item">
				<div class="dot-wrap" >
					<hr class="dot" style="border-color:#00FFA1"/>
				</div>
				<div class="line-wrap">
					<hr class="line" style="transform:rotate(30deg)"/>
				</div>
				<div class="dot-wrap">
					<hr class="dot" style="border-color:#00B7FF"/>
				</div>
				<div class="line-wrap">
					<hr class="line" style="transform:rotate(10deg)"/>
				</div>
				<div class="dot-wrap">
					<hr class="dot" style="border-color:#011EFF"/>
				</div>
				<div class="line-wrap">
					<hr class="line" style="transform:rotate(-20deg)"/>
				</div>
				<div class="dot-wrap">
					<hr class="dot" style="border-color: #BD00FF"/>
				</div>
				<div class="line-wrap">
					<hr class="line" style="transform:rotate(30deg)"/>
				</div>
				<div class="dot-wrap">
					<hr class="dot" style="border-color:#00FFA1"/>
				</div>
				<div class="line-wrap">
					<hr class="line" style="transform:rotate(-32deg)"/>
				</div>
				<div class="dot-wrap">
					<hr class="dot" style="border-color:#00B7FF"/>
				</div>
				<div class="line-wrap">
					<hr class="line" style="transform:rotate(40deg)"/>
				</div>
				<div class="dot-wrap">
					<hr class="dot" style="border-color:#011EFF"/>
				</div>
				<div class="line-wrap">
					<hr class="line" style="transform:rotate(-14deg)"/>
				</div>
				<div class="dot-wrap">
					<hr class="dot" style="border-color:#BD00FF"/>
				</div>
				<div class="line-wrap">
					<hr class="line" style="transform:rotate(-14deg)"/>
				</div>
			</div>
			</div>
			</div>
		</div>
		<div class="nav">
			<router-link class="button cursor-another" to="/Main">MAIN</router-link>
			<router-link class="button  cursor-another" to="/Memex">MEMEX<sup>2</sup></router-link>
		</div>
		<div class="log-wrap">
			<img class="logo" style="width:100%;max-width:200px;" src="https://nft-1258500098.cos.ap-beijing.myqcloud.com/logo_background.png"/>
		</div>
		<div class="about">
			<p class="p1">1. 什么是P(A)</p>
			<p class="p2">P(A) —艺术的全概率是一个基于SRARCOIN区块链发行、收集和交易NFT独立艺术项目的平台。</p>
			<p class="p1">2. 关于P(A)</p>
			<p class="p2">P(A) 是基于生成艺术与区块链技术结合的实验项目。每个 P(A) 都是独一无二的，并通过嵌入在 STARCOIN 区块链中的智能合约为其购买者铸币创建。有别于大多数艺术家个体或画廊利用NFT作为在线艺术品交易市场，P(A)项目实际上是“区块链上的艺术”。链上的 TokenID 作为 NFT 唯一的标识符，艺术品通过部署在合约中的与 TokenID 相关联的随机算法逐一生成。对于创作者而言不仅仅是将作品放在区块链上；相反，将区块链、加密技术、概率——以及它的可能性——作为艺术创作实验的元素，带着质疑就区块链的潜力与艺术背景之间产生更复杂的对话。</p>
			<p class="p2">WEB2.0  时代技术创造了极大的信息繁荣，中心化的技术架构使得数字资产存在被篡改的可能，我们逐渐意识到互联网层信息所有权的脆弱性；区块链、共识机制、加密技术创造的 WEB 3.0时代，使得私钥所有者牢牢把控信息的所有权。我们试图结合 WEB 2.0 与 WEB 3.0 技术，探讨数字资产在不同信息技术时代的表现形式。NFT 特性使得数字资产在区块链层被唯一记录，但其中定义的概率使得数字资产在互联网层的展式变得不确定, 项目中随机的展示形式也提醒购买者意识到当下 NFT 与加密艺术市场的潜在风险，以及数字资产在 WEB 2.0 时代的所有权也是不清晰的；期望购买者能更为深入的了解 WEB 3.0 特性，在区块链层进行资产的确权。</p>
			<p class="p1">3. 技术细节</p>
			<p class="p2 p2-s">项目诣在探索区块链与艺术创作之间的可能性，通过设计多个随机性技术层面创造了针对独立项目、趋于小组织的数字艺术的NFT市场。</p>
			<p class="p2">生成艺术：</p>
			<ul>
				<li>图像经由一些列参数生成，选取的基本图形元素为：点、线。P(A)  #1–#100 每件作品从毫无关联的两组图像中随机配对组合。</li>
			</ul>
			<p class="p2">作品的存储与获取：</p>
			<ul>
				<li>图像本身存储在中心化的数据库里，链上只保存图像的参数。NFT对应的展示的作品从区块链上的详细参数计算得到。</li>
			</ul>
			<p class="p2">随机与不确定性：</p>
			<ul>
				<li>每组作品组合的随机配对。</li>
				<li>收藏者在铸币成功后在未知的情况下获取任意可能的一组作品。</li>
				<li>互联网层图像展示的随即特性是通过区块链技术对艺术品的概率参数进行定义的。</li>
				<li>收藏者所拥有的NFT在互联网层的图像展示是不确定的，而作品不确定性本身是被区块链层完全确定的。</li>
			</ul>
			<p class="p2">交互性：</p>
			<ul>
				<li>通过有交互功能的网页设计加深收藏者的参与度。</li>
				<li>我们试图消除 P(A) 作为NFT交易的复杂性，尽量简化体验的过程，这也有助于理解背后的故事。</li>
			</ul>
			<p class="p1">4. STATCOIN 区块链和 STC</p>
			<p class="p2">P(A) 建立在 STARCOIN 上，这是一个区块链计算平台，允许任何人安全地验证该项目的艺术创作和所有权。</p>
			<p class="p2">STATCOIN 的数字货币或加密货币称为 STC 。P(A) 上的所有交易都使用 STC。</p>
			<p class="p2">一旦在 P(A) 铸币成功，销售永远记录在区块链上的代币历史中。</p>
			<p class="p1">5. MEMEX<sup>2</sup>的权利</p>
			<p class="p2">MEMEX<sup>2</sup> 是 P(A) 项目的创作、开发小组：</p>
			<p class="p2">MEMEX<sup>2</sup> 拥有版权和形象权。这意味着收藏家无法复制或制作关于作品的衍生品。</p>
			<p class="p2">MEMEX<sup>2</sup> 授予收藏家使用、展示和转售作品的某些权利。</p>
			<p class="p2">MEMEX<sup>2</sup> 特此保留复制或复制作品的所有权利。</p>
			<p class="p2">MEMEX<sup>2</sup> 将永远被信任。任何时候作品被展示或分享，最终都归属于MEMEX<sup>2</sup>。无论未来将我们带到何处，作为创作者的权利都将受到永久保护。</p>
			<p class="p1">6. 收藏家的权利</p>
			<p class="p2">“收藏家” 是指记录在 P(A) 原创的数字财产中作品的购买者。当您在 P(A) 上拥有项目的数码作品时，您有权执行以下操作：</p>

			<p class="p2">下载作品：作为收藏家，您可以访问一个永久链接并且在其中下载原始作品、全分辨率1980*1980dpi的文件。</p>
			<p class="p2">展示作品：在获得 P(A) 方同意，收藏家可以私下、公开展展示作品, 但请详细标明作品的出处。在展示 P(A) 的作品时不得修改、歪曲或以其他方式篡改作品，请尊重项目开发者 MEMEX<sup>2</sup> 的权利。</p>
			<p class="p2">唯一性：收藏家所拥有的每一件 P(A) 上作品都是单一版本。</p>
			<p class="p2">确保作品的真实性。记录在 STARCOIN 区块链上信息可以提供作品的明确出处和交易历史</p>
			<p class="p2">您将永远保留这些权利。只要收藏家不转售或转让所有权，您对作品的权利将得到永久保障。</p>

			<p class="p1">7. 交易操作</p>
			<p class="p2">具体交易流程根据首页按钮🔘链接钱包操作完成</p>

			<p class="p1">8. 转让和二级市场</p>
			<p class="p2">MEMEX<sup>2</sup> 期望看到 P(A) 的作品能产生更多的的增值价值，请期待我们针对转让和二级市场的销售的后续开发，也或许是其他的项目（待定）</p>
		</div>
		<div id="footer">
			<div class="animate">
			<div class="footer-text" v-for="item in 2" :key="item">
				<p class="text">P(A)</p>
				<p class="text"> WELCOME</p>
				<p class="mark text" style="color:#00FFA1">!</p>
				<p class="text">P(A)</p>
				<p class="text"> WELCOME</p>
				<p class="mark text" style="color:#00B7FF">!</p>
				<p class="text">P(A)</p>
				<p class="text"> WELCOME</p>
				<p class="mark text" style="color:#011EFF">!</p>
				<p class="text">P(A)</p>
				<p class="text"> WELCOME</p>
				<p class="mark text" style="color:#BD00FF">!</p>
				<p class="text">P(A)</p>
				<p class="text"> WELCOME</p>
				<p class="mark text" style="color:#D501FE">!</p>
			</div>
			</div>
		</div>
		
	</div>
</template>

<style scoped>
	.container {
		margin: auto;
		max-width: 1500px;
		cursor: url(https://nft-1258500098.cos.ap-beijing.myqcloud.com/cursor-line.png) -8 8, auto;
	}
	.cursor-another {
		cursor: url(https://nft-1258500098.cos.ap-beijing.myqcloud.com/cursor-point.png) -8 8, auto;
	}
	.head {
		margin: auto;
		height: 40px;
		border: 6px solid;
		overflow: hidden;
	}
	.reverse {
		animation: 8s wordsLoop-reverse linear infinite;
	}
	.animate-reverse {
		display: flex;
		flex-direction: row;
		justify-content: space-around;
    }
	.head-unit {
		display: flex;
		flex-direction: row;
		width: 744px;
	}
	.dot-wrap {
		width: 50px;
	}
	.line-wrap {
		width: 50px;
	}
	.dot {
		border:none;
		border-top:10px dotted #f00;
		color:#fff;
		background-color:#fff;
		height:1px;
		width:10px;
		margin-left: 5px;
		margin-top: 15px;
	}
	.line {
		border:none;
		border-top:1px;
		background-color:#000;
		height:5px;
		width:40px;
		margin-left: 5px;
		margin-top: 17px;
	}
	.nav {
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		font-size: 22px;
		margin-left: 8px;
		margin-right: 8px;
	}
	.button {
		font-family: Impact, Haettenschweiler, "Franklin Gothic Bold", Charcoal, "Helvetica Inserat", "Bitstream Vera Sans Bold", "Arial Black", "sans serif";
		color: #000;
		text-decoration: none;
		font-size: 30px;
	}
	.log-wrap {
		background-size: 40px;
		margin-top: 40px;
	}
	.about {
		position: relative;
		width: 90%;
		font-size: 24px;
		text-align: left;
		margin: auto;
		padding-bottom: 70px;
	}
	.p1 {
		font-weight: bold;
		margin-bottom: 0px;
	}
	.p2 {
		font-size: 21px;
		margin-top: 0px;
		margin-bottom: 0px;
	}
	.p2-s {
		margin-bottom: 10px;
	}
	ul {
		font-size: 21px;
		margin-top: 0px;
		margin-bottom: 0px;
	}
	#footer {
		z-index: 300;
		position: fixed;
		margin: 0px;
		width: 100%;
		max-width: 1488px;
		height: 50px;
		bottom: 0px;
		border: 6px solid;
		overflow: hidden;
		display: flex;
		flex-direction: row;
	}
	.footer-text {
		font-family: Impact, Haettenschweiler, "Franklin Gothic Bold", Charcoal, "Helvetica Inserat", "Bitstream Vera Sans Bold", "Arial Black", "sans serif";
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		margin: 0px;
		height: 50px;
		width: 1488px;
		border-color: black;
		color: #000;
	}
	.text {
		font-size: 36px;
		margin: 0px;
		margin-left: 11px;
	}
	.mark {
		margin: 0px;
		font-weight: bold;
	}
	.animate {
		display: flex;
		flex-direction: row;
		width: 1488px;
		animation: 15s wordsLoop linear infinite normal;
    }
	
	@keyframes wordsLoop {
		0% {
			transform: translateX(-50%);
		}
		100% {
			transform: translateX(50%);
		}
	}

	@keyframes wordsLoop-reverse {
		0% {
			transform: translateX(0);
		}
		100% {
			transform: translateX(-50%);
		}
	}
 
	@keyframes heartbeat{
		0%{transform: scale(0.8,0.8); opacity:1;}
		25%{transform: scale(1,1); opacity: 0.8;}
		100%{transform: scale(0.8,0.8); opacity:1;}
	}


</style>
