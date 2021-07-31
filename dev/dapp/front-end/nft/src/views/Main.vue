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
			<router-link class="button cursor-another" to="/About">ABOUT</router-link>
			<div class="memex-button button cursor-another">
				<router-link class="button cursor-another" to="/Memex">MEMEX<sup>2</sup></router-link>
			</div>
			<div class="button" v-if="isWalletConnected">WALLET CONNECTED</div>
			<div class="button cursor-another" v-else-if="walletInstalled" @click="connectWallet">CONNECT WALLET</div>
			<div class="button cursor-another" v-else @click="installWallet">INSTALL WALLET</div>
		</div>
		<div class="log-wrap">
			<img class="logo" style="width:100%;max-width:200px;" src="https://nft-1258500098.cos.ap-beijing.myqcloud.com/logo_background.png"/>
		</div>
		<div class="about"></div>
		<div class="footer">
			<div class="animate">
			<div class="footer-text" v-for="item in 5" :key="item">
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
		<div class="about-text">
			<p>
P(A) 是基于生成艺术与区块链技术结合的实验项目。每个 P(A) 都是独一无二的，通过嵌入在 STARCOIN 区块链中的智能合约为其购买者铸币创建。有别于大多数艺术家个体或画廊利用 NFT 作为在线艺术品交易市场，P(A) 项目实际上是“区块链上的艺术”。链上的 TokenID 作为 NFT 唯一的标识符，艺术品通过部署在合约中的与 TokenID 相关联的随机算法逐一生成。对于创作者而言不仅仅是将作品放在区块链上；相反，将区块链、加密技术、概率——以及它的可能性——作为艺术创作实验的元素，带着质疑就区块链的潜力与艺术背景之间产生更复杂的对话。
			</p>
		</div>
		<div class="mint-text">
			<p>
				点击下方按钮 “ MINTING ”—“铸造新的NFT ”。成功后 🚩，收藏者将随机收获基于 TOKEN ID 生成的带有编号的 P(A) 视觉作品，该 NFT 即是收藏者在 STARCOIN 区块链网络中的唯一代码。

P(A) 项目仅且只会生成 100 组作品,  购买所需的价格按照梯度随创建的个数增加而增加。价格依次为：
		<div class="price-div">
			<div :class="level===0 ? 'weight' : 'light'">88STC，</div>
			<div :class="level===1 ? 'weight' : 'light'">388STC，</div>
			<div :class="level===2 ? 'weight' : 'light'">688STC，</div>
			<div :class="level===3 ? 'weight' : 'light'">1088STC</div>。
			<div class="mark-price-text">蓝色标记当前价格。</div>
		</div>
			<p>确认铸币后，请耐心等待 5-10 分钟再刷新主页面，NFT作品将随机生成在 ⬇ ️展示页面，请根据作品下方详情处的绿色圆形标记和钱包 ID 来认领属于您的 NFT; 接下来就是 SUPRISE !
				</p>
		</div>
		<div class='mint-button cursor-another' v-if="init" @click="mint">
			<div class="button-img cursor-another">
				<img class="mint-button-img heartbeat-animation" style="max-width:200px" src="https://nft-1258500098.cos.ap-beijing.myqcloud.com/button.png"/>
			</div>
			<div class="button-img">
				<img class="mint-button-brother-img spin-animation" style="max-width:600px" src="https://nft-1258500098.cos.ap-beijing.myqcloud.com/button%27s%20bro.png"/>
			</div>
		</div>
		<div class='mint-button cursor-another' v-else @click="openmarket">
			<div class="button-img cursor-another">
				<img class="mint-button-img heartbeat-animation" style="max-width:200px" src="https://nft-1258500098.cos.ap-beijing.myqcloud.com/button.png"/>
			</div>
			<div class="button-img">
				<img class="mint-button-brother-img spin-animation" style="max-width:600px" src="https://nft-1258500098.cos.ap-beijing.myqcloud.com/button%27s%20bro.png"/>
			</div>
		</div>
		<div class="card-container cursor-another" >
			<el-row v-for="i in 25" :key="i"  type="flex" justify="space-between" :gutter="30">
				<el-col :span="6" v-for="o in 4" :key="o" >
					<el-card :body-style="{height: '450px', padding: '0px', border: '1px solid'}" shadow="never">
						<div @click="modal(nft_list[String(position[(i-1)*4+o-1]-1)])" v-if="Boolean(nft_list[String(position[(i-1)*4+o-1]-1)])">
							<img :class="nft_list[String(position[(i-1)*4+o-1]-1)].type == 'weave' ? 'weave': 'grainshade'" :src="nft_list[String(position[(i-1)*4+o-1]-1)].img"/>
							<div class="info-upper">
								<p>NO: P(A)#{{nft_list[position[(i-1)*4+o-1]-1].id}}</p>
								<p>PRICE: {{nft_list[position[(i-1)*4+o-1]-1].price}}STC</p>
							</div>
							<hr class="info-hr"/>
							<div class="info-bottom">
								<p>OWNER: {{nft_list[String(position[(i-1)*4+o-1]-1)].address}}</p>
								<div class="owner-dot" v-if="nft_list[String(position[(i-1)*4+o-1]-1)].address == account[0]">
									<div></div>
								</div>
							</div>
						</div>
						<div v-else>
							<div class="card-dot" v-if="(i + o) % 2 == 0">
								<div></div>
							</div>
							<div class="card-line" v-if="(i + o) % 2 == 1">
								<div></div>
							</div>
						</div>
						<div style="padding: 14px;">
							<div class="bottom clearfix">
							</div>
						</div>
					</el-card>
				</el-col>
			</el-row>
		</div>
		<el-dialog
			:visible.sync="dialogVisible"
			width="700px"
			>
			<img :src="modalImage" style="max-width:600px"/>
			<div class="info-upper">
				<p>NO: P(A)#{{id}}</p>
				<p>PRICE: {{price}}STC</p>
			</div>
			<hr class="info-hr"/>
			<div class="info-bottom">
				<p>OWNER: {{owner}}</p>
			</div>
		</el-dialog>	
	</div>
</template>

<script>
	import api from '../api'
	import StarMaskOnboarding from '@starcoin/starmask-onboarding'
	// import { providers, utils, bcs, encoding } from '@starcoin/starcoin'
	const { isStarMaskInstalled } = StarMaskOnboarding;
	import BigNumber from 'bignumber.js'
	import { arrayify, hexlify } from '@ethersproject/bytes'
	import { providers, utils, bcs } from '@starcoin/starcoin'
	export default {
		data: function () {
			return {
				id: "",
				price: 88,
				owner: "",
				modalImage: "",
				dialogVisible: false,
				position: [3, 62, 64, 1, 92, 58, 2, 41, 99, 67, 97, 36, 4, 12, 71, 35, 5, 26, 15, 14, 44, 82, 16, 25, 76, 13, 77, 56, 48, 91, 7, 69,  55, 10, 86, 42, 54, 53, 51, 59, 96, 83, 37, 75, 100, 57, 80, 46, 60, 47, 11, 34, 30, 61, 94, 89, 84, 32, 74, 63, 22, 17, 88, 6, 95, 68, 21, 50, 24, 20, 19, 40, 9, 38, 73, 87, 70, 43, 45, 23, 81, 65, 31, 90, 72, 18, 66, 28,  93, 79, 78, 27, 33, 49, 98, 39,  8, 85, 52, 29],
				nft_list: {},
				isWalletConnected: false,
				account: [],
				walletInstalled: false,
				curPrice: 188,
				starcoinP: "",
				init: true,
				level: ''

			}
		},
		methods: {
			modal: function (index) {
				console.log(index)
				this.modalImage = index.img;
				this.dialogVisible = true;
				this.id = index.id;
				this.price = index.price;
				this.owner = index.address;
			},
			handleClose(done) {
				this.$confirm('确认关闭？')
				.then(() => {

					done();
				})
				.catch(() => {});
			},
			installWallet: function () {
				const currentUrl = new URL(window.location.href)
				const forwarderOrigin = currentUrl.hostname === 'localhost'
				? 'http://localhost:9032'
				: undefined
				let onboarding
				try {
					onboarding = new StarMaskOnboarding({ forwarderOrigin })
				} catch (error) {
					console.error(error)
				}
				onboarding.startOnboarding()
			},
			connectWallet: async function() {
				try {
					const newAccounts = await window.starcoin.request({
						method: 'stc_requestAccounts',
					})
					this.account = newAccounts;
					console.log(newAccounts)
					this.isWalletConnected = true;
					console.log(newAccounts)
				} catch (error) {
					console.error(error)
				}
			},
			mint: async function() {
				if (!this.walletInstalled) {
					this.installWallet()
				}
				if (!this.isWalletConnected) {
					this.connectWallet();
				}
				console.log(this.curPrice);
				try {
					const functionId = '0xC137657E5aeD5099592BA07c8ab44CC5::NFT_MODULES::mint'
					const strTypeArgs = []
					const tyArgs = utils.tx.encodeStructTypeTags(strTypeArgs)

					const sendAmount = this.curPrice;
					if (!(sendAmount > 0)) {
					// eslint-disable-next-line no-alert
					window.alert('Invalid sendAmount: should be a number!')
					return false
					}
					const BIG_NUMBER_NANO_STC_MULTIPLIER = new BigNumber('1000000000')
					const sendAmountSTC = new BigNumber(sendAmount, 10)
					const sendAmountNanoSTC = sendAmountSTC.times(BIG_NUMBER_NANO_STC_MULTIPLIER)
					const sendAmountHex = `0x${sendAmountNanoSTC.toString(16)}`

					// Multiple BcsSerializers should be used in different closures, otherwise, the latter will be contaminated by the former.
					const amountSCSHex = (function () {
					const se = new bcs.BcsSerializer()
					// eslint-disable-next-line no-undef
					se.serializeU128(BigInt(sendAmountNanoSTC.toString(10)))
					return hexlify(se.getBytes())
					})()
					console.log({ sendAmountHex, sendAmountNanoSTC: sendAmountNanoSTC.toString(10), amountSCSHex })

					const args = [
					arrayify(amountSCSHex),
					]

					const scriptFunction = utils.tx.encodeScriptFunction(functionId, tyArgs, args)
					console.log(scriptFunction)

					// Multiple BcsSerializers should be used in different closures, otherwise, the latter will be contaminated by the former.
					const payloadInHex = (function () {
					const se = new bcs.BcsSerializer()
					scriptFunction.serialize(se)
					return hexlify(se.getBytes())
					})()
					console.log({ payloadInHex })

					const transactionHash = await this.starcoinP.getSigner().sendUncheckedTransaction({
					data: payloadInHex,
					})
					api.updateCache();
					console.log({ transactionHash })

				} catch (error) {
					console.log(error)
					throw error
				}
			},
			openmarket: async function() {
				if (!this.walletInstalled) {
					this.installWallet()
				}
				if (!this.isWalletConnected) {
					this.connectWallet();
				}
				try {
					const functionId = '0xC137657E5aeD5099592BA07c8ab44CC5::NFT_MODULES::init_market'
					const strTypeArgs = []
					const tyArgs = utils.tx.encodeStructTypeTags(strTypeArgs)

					// Multiple BcsSerializers should be used in different closures, otherwise, the latter will be contaminated by the former.
					const args = [
					]

					const scriptFunction = utils.tx.encodeScriptFunction(functionId, tyArgs, args)
					console.log(scriptFunction)

					// Multiple BcsSerializers should be used in different closures, otherwise, the latter will be contaminated by the former.
					const payloadInHex = (function () {
						const se = new bcs.BcsSerializer()
						scriptFunction.serialize(se)
						return hexlify(se.getBytes())
					})()
					console.log({ payloadInHex })

					const transactionHash = await this.starcoinP.getSigner().sendUncheckedTransaction({
						data: payloadInHex,
					})
					api.updateCache();
					console.log({ transactionHash })

				} catch (error) {
					console.log(error)
					throw error
				}
			}
		},
		beforeMount: async function() {
			try {
				if (window.starcoin) {
				// We must specify the network as 'any' for starcoin to allow network changes
				let starcoinProvider = new providers.Web3Provider(window.starcoin, 'any')
				this.starcoinP = starcoinProvider;
				}
			} catch (error) {
				console.error(error)
			}
			try {
				if (isStarMaskInstalled()) {
					this.walletInstalled = true;
					window.starcoin.request({
					method: 'stc_accounts',
					}).then(res => {
						if (res.length == 0) {
							this.isWalletConnected = false;
						} else {
							this.account = res;
							this.isWalletConnected = true;
						}
						
					})
				} else {
					this.walletInstalled = false;
				}
				
			} catch (error) {
				console.error(error)
			}
			api.getNFTMarket().then(res => {
				console.log(res)
				if (res.length == 0) {
					this.init = false;
					return;
				}
				console.log(this.init)
				const imageBaseUrl = 'https://nft-1258500098.cos.ap-beijing.myqcloud.com/'
				let nft_array = res.market_nft_info;
				let nft_list_ = {};
				let price_list = [0.05, 0.07, 0.09, 0.1]
				this.curPrice = res.min_price / 1000000000;
				console.log(this.curPrice)
				for (let i = 0; i < price_list.length; i++) {
					if (price_list[i] == this.curPrice) {
						this.level = i;
						console.log(i)
					}
				}
				console.log(res)
				console.log(nft_array)
				for (let i = 0; i < nft_array.length; i++) {
					let item = nft_array[i];
					let param = item.data;
					api.getNFTImage(param.prob_a, param.prob_b).then(response => {
						let filename = "";
						if (response.data == "weave") {
							filename = imageBaseUrl + 'weave images/' + String(item.id) + '_' + String(param.param_1[0]) + '_' + String(param.param_1[1] / 1000) + '_' + String(param.param_1[2] / 100) + '.jpg'
						} else {
							filename = imageBaseUrl + 'grainshade image/' + String(item.id) + '_' + String(param.param_2[0] / 100) + '_' + String(param.param_2[1]) + '_' + String(param.param_2[2] / 10) + '_' + String(param.param_2[3]) + '.jpg'
						}
						let address = (i == (nft_array.length - 1)) ? res.head : nft_array[i+1].next_nft_owner;
						nft_list_[String(i)] = {
							id: item.id,
							img: filename,
							address: address,
							price: item.price / 1000000000,
							type: response.data
						}
						this.nft_list = nft_list_;
					});
					
				}
				
			})
			// api.getNFTImage("50", "50").then(res => console.log(res))
			// api.updateCache().then(res => console.log(res))
			// api.getOwnerNFT('0x4d72f898d7997e38b681b380a8c4c074').then(res => console.log(res))
			// console.log(Boolean(this.nft_list[0]))
		}
	}

</script>


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
	.memex-button {
		position: relative;
		left: 65px;
		color: #000;
	}
	.log-wrap {
		background-size: 40px;
		margin-top: 60px;
		margin-bottom: 60px;
	}
	.about-text {
		font-size: 21px;
		text-align: left;
		margin-left: 50px;
		margin-right: 50px;
	}
	.mint-text {
		text-align: left;
		margin-left: 50px;
		margin-right: 50px;
		margin-top: 60px;
		margin-bottom: 2px;
		font-size: 21px;
		/* display: flex;
		flex: row;
		justify-content: left; */
	}
	.price-div {
		display: flex;
		flex-direction: row;
		margin-top: 2px;

	}
	.weight {
		font-weight: 900;
		color: #00f;
	}
	.mark-price-text {
		margin-top: -2px;
	}
	.mint-button {
		position: relative;
		width: 600px;
		height: 520px;
		margin: auto;
		text-align: center;
		margin-top: 10px;
	}
	.button-img {
		position: absolute;
		width: 600px;
	}
	.mint-button-img {
		position: relative;
		top: 185px;
	}
	.mint-button-brother-img {
		position: relative;
		top: 50px;
	}
	.card-container {
		width: 1400px;
		margin: auto;
	}
	.el-row {
		padding-bottom: 50px;
	}
	.weave {
		max-width: 324px;
	}
	.grainshade {
		max-width: 321px;
	}
	.info-upper {
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		margin-left: 10px;
		margin-right: 10px;
	}
	
	.info-hr {
		margin: 0px;
		margin-left: 10px;
		margin-right: 10px;
	}
	.info-bottom {
		text-align: left;
		margin-left: 10px;
	}
	.owner-dot {
		position: relative;
		left: 120px;
		top: -58px;
		border:12px solid #00ffa1;
		color:#00ffa1;
		background-color:#00ffa1;
		height:20px;
		width:20px;
		border-radius: 100%;
		margin: auto;	
		opacity: 0.7;
	}
	.cls-1 {
		width: 50px;
	}
	.card-dot {
		position: relative;
		top: 187px;
		border:10px solid #000;
		color:#fff;
		background-color:#fff;
		height:20px;
		width:20px;
		border-radius: 100%;
		margin: auto;
	}
	.card-line {
		position: relative;
		top: 200px;
		border:6px solid #000;
		color: #fff;
		height:0px;
		width:80px;
		margin: auto;
	}
	
	.footer {
		z-index: 300;
		position: fixed;
		/* max-width: 1300px; */
		bottom: 0px;
		margin: auto;
		height: 50px;
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

	.spin-animation {
		animation: spin 10s linear infinite;
	}
	.heartbeat-animation {
		animation: 3s heartbeat linear infinite normal
	}
	@keyframes wordsLoop {
		0% {
                transform: translateX(-1145px);
                -webkit-transform: translateX(-1145px);
            }
            100% {
                transform: translateX(0px);
                -webkit-transform: translateX(0px);
            }
	}

	@keyframes wordsLoop-reverse {
		0% {
			transform: translateX(0%);
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

	@keyframes spin{
		100% { transform:rotate(-360deg); } 
	}


</style>
