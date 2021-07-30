<template>
  <div class="home">
	<router-link to="/Main">
		<div class="enter-button-wrap">
			<img id="enter" class="enter-button" style="width:100%;max-width:90px;" src="https://nft-1258500098.cos.ap-beijing.myqcloud.com/logo2.png"/>
		</div>
	</router-link>
	<div id="bg1" class="image">
		<div v-for="item in div_num" @mouseover="hover_handler(item)" v-bind:id="item" class="bg1 grid" :key="item" v-bind:style="{width:div_width, height:div_height, opacity:op[item]}"></div>
	
	</div>
	<div id="bg2" class="image bg2">
	</div>
	<div class="footer">
			<div class="animate">
			<div class="footer-text" v-for="item in 3" :key="item">
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

<script>
// @ is an alias to /src

export default {
  name: 'Home',
  components: {
  },
  data: function () {
	return {
		div_num: 0,
		div_width: "50px",
		div_height: "50px",
		op: [],
	}
  },
  beforeMount: function () {
	let screen_width = document.body.clientWidth;
	let screen_height = document.body.clientHeight;
	let row_divs = 35;
	let div_width = screen_width / row_divs;
	let col_divs = parseInt(screen_height / div_width) + 1;
	let div_num = (row_divs+1) * col_divs;
	this.div_num = div_num;
	this.div_width = String(div_width)+'px';
	this.div_height = String(div_width)+'px';
	let a = new Array();
	for (let i = 0; i < div_num; i++) {
		a.push(1);
	}
	this.op = a;
  },
  methods: {
	hover_handler: function (item) {
		let element = document.getElementById(item);
		element.style.opacity = "0";
	}
  }
}
</script>

<style scoped>
	html {
		height: 100%;
	}
	.home {
		width: 100%;
		height: 100%;
		position: relative;
		overflow: hidden;
	}
	.enter-button-wrap {
		background-size: 15px;
	}
	#enter {
		z-index: 300;
		animation: 3s heartbeat linear infinite normal;
	}
	.enter-button {
		position: absolute;
		left: 15px;
		top: 15px;
	}
	.image {
		width: 100%;
		height: 100%;
		position: absolute;
		opacity: 1;
	}
	#bg1 {
		z-index: 100;
	}
	#bg1 .grid {
		background-image: url("https://nft-1258500098.cos.ap-beijing.myqcloud.com/bg1.jpg");
		background-position: bottom right;
		background-repeat: no-repeat;
		background-size: cover;
		background-attachment: fixed;
		z-index: 100;
	}
	#bg2 {
		z-index: 1;
	}
	.bg2 {
		background-image: url("https://nft-1258500098.cos.ap-beijing.myqcloud.com/bg2.jpg");
		background-repeat: no-repeat;
		background-position: right;
		background-size: cover;
		z-index: 1;
	}
	.grid {
		float: left;
		opacity: 1;
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
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		margin: 0px;
		height: 50px;
		/* width: 1488px; */
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
		/* width: 1488px; */
		animation: 15s wordsLoop linear infinite normal;
    }
	
	@keyframes wordsLoop {
            0% {
                transform: translateX(200px);
                -webkit-transform: translateX(200px);
            }
            100% {
                transform: translateX(-100%);
                -webkit-transform: translateX(-100%);
            }
        }
 
        @-webkit-keyframes wordsLoop {
            0% {
                transform: translateX(200px);
                -webkit-transform: translateX(200px);
            }
            100% {
                transform: translateX(-100%);
                -webkit-transform: translateX(-100%);
            }
        }
		@keyframes heartbeat{
			0%{transform: scale(0.8,0.8); opacity:1;}
			25%{transform: scale(1,1); opacity: 0.8;}
			100%{transform: scale(0.8,0.8); opacity:1;}
		}

</style>
