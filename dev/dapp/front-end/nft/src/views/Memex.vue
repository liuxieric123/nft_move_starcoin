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
			<router-link class="button cursor-another" to="/ABOUT">ABOUT</router-link>
			<router-link class="button cursor-another" to="/Main">MAIN</router-link>
		</div>
		<div class="log-wrap">
			<img class="logo" style="width:100%;max-width:450px;" src="https://nft-1258500098.cos.ap-beijing.myqcloud.com/memex.png"/>
		</div>
		<div class="memex">
			<p>MEMEX<sup>2</sup> 是此项目设计开发的小组，由两位成员组成。</p>

<p>请大家多多支持我们这种不依赖于任何机构的独立艺术家和开发者探索更多的可能性；</p>

<p>同时我们也想说通过当前和未来的技术, MEMEX<sup>2</sup> 期望每一个作品都将存在于任何空间，无论是虚拟的、真实的。</p>

<p>不要吝啬的点点你的小手指关注我们的WX公众号：<a class="link" href="https://mp.weixin.qq.com/s/LfugHRqEGppI_CX51Gj_hQ">阈限剧场</a></p>
		</div>
		<div id="footer">
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

</p>
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
	.button {
		font-family: Impact, Haettenschweiler, "Franklin Gothic Bold", Charcoal, "Helvetica Inserat", "Bitstream Vera Sans Bold", "Arial Black", "sans serif";
		color: #000;
		text-decoration: none;
	}
	.log-wrap {
		margin: auto;
		background-size: 40px;
	}
	.logo {
		position: relative;
		top: 100px;
	}
	.memex {
		position: relative;
		margin: auto;
		text-align: center;
		top: 200px;
		font-size: 25px;
		height: 400px;
	}
	.about-text {
		font-size: 27px;
		margin-left: 50px;
		margin-right: 50px;
	}
	.link {
		color: #00ffa1;
		text-decoration: none;
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
                transform: translateX(-1394.22px);
                -webkit-transform: translateX(-1394.22px);
            }
            100% {
                transform: translateX(0px);
                -webkit-transform: translateX(0px);
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
