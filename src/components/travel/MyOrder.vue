<template>
	<div>
		<div id="orderTop">
			<mt-header title="我的订单" >
		  		<router-link to="/My" slot="left">
		    	<mt-button icon="back"></mt-button>
	  		</router-link>
		</mt-header>
		</div>
			<mt-navbar v-model="selected" >
				<mt-tab-item id="order">全部订单</mt-tab-item>
				<mt-tab-item id="pay">待支付</mt-tab-item>
				<mt-tab-item id="trip">待出行</mt-tab-item>
				<mt-tab-item id="comment">待评价</mt-tab-item>
			</mt-navbar>
		<mt-tab-container v-model="selected">
	  		<mt-tab-container-item id="order" @click="getVal(id)">
				  111
	  			<!-- <orderlist v-for="n in 2" ></orderlist> -->
	  		</mt-tab-container-item>
	  		<mt-tab-container-item id="pay" @click="getVal(id)">
				  222
	    		<!-- <orderlist v-for="n in 4"></orderlist> -->
	  		</mt-tab-container-item>
	  		<mt-tab-container-item id="trip" @click="getVal(id)">
				  333
	    		<!-- <orderlist v-for="n in 10"></orderlist> -->
	  		</mt-tab-container-item>
	  		<mt-tab-container-item id="comment" @click="getVal(id)">
				  444
	    		<!-- <orderlist v-for="n in 3"></orderlist> -->
	  		</mt-tab-container-item>
		</mt-tab-container>
	</div>
</template>
<script>
	import OrderList from "./OrderList.vue"
	export default{
		data(){
			return{
				selected:""
			}
		},
		props:["val"],
		created(){
			this.getVal()
			this.selected=this.val;
		},
		methods:{
			getVal(){
				var selected;
				this.selected=this.$route.params.val;
				return selected;
				console.log(selected);
			}
		},
		components:{
			'orderlist':OrderList
		}
	}
</script>
<style scoped>
	.mint-navbar{
		margin-top:40px;
	}
	.mint-header{
		background-color:#fff;
		border-bottom:1px solid rgb(235,234,234)
	}
	.mint-tab-container-item{
		padding: 5px 0;
	}
	.mint-header-title{
		font-weight:400;
		font-size:18px;
		color:rgb(42,41,41);
	}
	.mint-button-icon{
		color:rgb(42,41,41)
	}
	.mint-navbar .mint-tab-item.is-selected{
		border-bottom: none;
	}
	/* .mint-tab-container-item{
		margin-top:87px;
	} */
</style>