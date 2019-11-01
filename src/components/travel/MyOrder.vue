<template>
	<div>
		<div id="orderTop">
			<ul>
				<li><router-link :to="'/home/'+uid+'/'+uid1">返回</router-link></li>
				<li>我的订单</li>
				<li>更多</li>
			</ul>
		</div>
			<mt-navbar v-model="selected" >
				<mt-tab-item id="order" @click.native="getnum(0)">全部订单</mt-tab-item>
				<mt-tab-item id="pay" @click.native="getnum(1)">待支付</mt-tab-item>
				<mt-tab-item id="trip" @click.native="getnum(2)">待出行</mt-tab-item>
				<mt-tab-item id="comment" @click.native="getnum(3)">待评价</mt-tab-item>
			</mt-navbar>
		<mt-tab-container v-model="selected">
	  		<mt-tab-container-item id="order" @click="getVal(id)">
				<ul v-for="(item,i) of list" :key="i" id="order_list">
					<li>
						<ul class="order_list">
							<li>序号</li>
							<li>姓名</li>
							<li>电话</li>
							<li>成人票数</li>
							<li>儿童票数</li>
							<li>团购票数</li>
							<li>状态</li>
							<li>总计</li>
						</ul>
					</li>
					<li>
						<ul class="order">
							<li>{{i}}</li>
							<li>{{item.uname}}</li>
							<li>{{item.phone}}</li>
							<li>{{item.adult}}</li>
							<li>{{item.children}}</li>
							<li>{{item.organize}}</li>
							<li>
								<span v-show="item.status===1">待支付</span>
								<span v-show="item.status===2">已支付</span>
								<span v-show="item.status===3">已评价</span>
							</li>
							<li>{{item.price}}</li>
						</ul>
					</li>
				</ul>
				
				
	  			<!-- <orderlist v-for="n in 2" ></orderlist> -->
	  		</mt-tab-container-item>
	  		<mt-tab-container-item id="pay" @click="getVal(id)">
				<ul v-for="(item,i) of list" :key="i" id="order_list">
					<li>
						<ul class="order_list">
							<li>序号</li>
							<li>姓名</li>
							<li>电话</li>
							<li>成人票数</li>
							<li>儿童票数</li>
							<li>团购票数</li>
							<li>状态</li>
							<li>总计</li>
						</ul>
					</li>
					<li>
						<ul class="order">
							<li>{{i}}</li>
							<li>{{item.uname}}</li>
							<li>{{item.phone}}</li>
							<li>{{item.adult}}</li>
							<li>{{item.children}}</li>
							<li>{{item.organize}}</li>
							<li>
								<span v-show="item.status===1">待支付</span>
								<span v-show="item.status===2">已支付</span>
								<span v-show="item.status===3">已评价</span>
							</li>
							<li>{{item.price}}</li>
						</ul>
					</li>
				</ul>
	    		<!-- <orderlist v-for="n in 4"></orderlist> -->
	  		</mt-tab-container-item>
	  		<mt-tab-container-item id="trip" @click="getVal(id)">
				<ul v-for="(item,i) of list" :key="i" id="order_list">
					<li>
						<ul class="order_list">
							<li>序号</li>
							<li>姓名</li>
							<li>电话</li>
							<li>成人票数</li>
							<li>儿童票数</li>
							<li>团购票数</li>
							<li>状态</li>
							<li>总计</li>
						</ul>
					</li>
					<li>
						<ul class="order">
							<li>{{i}}</li>
							<li>{{item.uname}}</li>
							<li>{{item.phone}}</li>
							<li>{{item.adult}}</li>
							<li>{{item.children}}</li>
							<li>{{item.organize}}</li>
							<li>
								<span v-show="item.status===1">待支付</span>
								<span v-show="item.status===2">已支付</span>
								<span v-show="item.status===3">已评价</span>
							</li>
							<li>{{item.price}}</li>
						</ul>
					</li>
				</ul>
	    		<!-- <orderlist v-for="n in 10"></orderlist> -->
	  		</mt-tab-container-item>
	  		<mt-tab-container-item id="comment" @click="getVal(id)">
				<ul v-for="(item,i) of list" :key="i" id="order_list">
					<li>
						<ul class="order_list">
							<li>序号</li>
							<li>姓名</li>
							<li>电话</li>
							<li>成人票数</li>
							<li>儿童票数</li>
							<li>团购票数</li>
							<li>状态</li>
							<li>总计</li>
						</ul>
					</li>
					<li>
						<ul class="order">
							<li>{{i}}</li>
							<li>{{item.uname}}</li>
							<li>{{item.phone}}</li>
							<li>{{item.adult}}</li>
							<li>{{item.children}}</li>
							<li>{{item.organize}}</li>
							<li>
								<span v-show="item.status===1">待支付</span>
								<span v-show="item.status===2">已支付</span>
								<span v-show="item.status===3">已评价</span>
							</li>
							<li>{{item.price}}</li>
						</ul>
					</li>
				</ul>
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
				selected:"",
				list:[],
				uid1:"tab4"
			}
		},
		props:["val",'i',"uid"],
		created(){
			this.getVal()
			this.selected=this.val;
			var status=this.i;
			this.getnum(status);
			
		},
		methods:{
			getVal(){
				var selected;
				this.selected=this.$route.params.val;
				return selected;
			},
			getnum(status){
				
				var obj={status:status}

			
				if(status>=1){
					this.axios.get('/findOrder',{params:obj})
					.then(result=>{
						this.list=result.data.data
					})
				}
				else{
					this.axios.get('/findOrder')
					.then(result=>{
						this.list=result.data.data
					})
				}
			}
		},
		components:{
			'orderlist':OrderList
		}
	}
</script>
<style scoped>
	#orderTop{
		width:100%;
		margin-bottom:15px;
		background:#fff;
	}
	#orderTop ul{
		display: flex;
		justify-content: space-between;
		width:100%;

	}
	#orderTop ul li{
		width:30%;
		padding:10px 0;
		text-align: center;
	}
	#orderTop ul li:nth-child(1){
		margin-left:10px;
		text-align: left
	}
	#orderTop ul li:nth-child(3){
		margin-right:10px;
		text-align: right;
	}
	.mint-navbar{
		margin-top:40px;
	}
	
	.mint-tab-container-item{
		padding: 5px 0;
	}
	.mint-navbar .mint-tab-item.is-selected{
		border-bottom: none;
	}
	/* .mint-tab-container-item{
		margin-top:87px;
	} */
	#order_list
	{
		width:100%;
		display: flex;
		justify-content: space-between;
		flex-wrap: wrap;
	}
	#order_list>li{
		width:100%;
	}
	.order{
		width:100%;
		display: flex;
		justify-content: space-between;
		flex-wrap: wrap;
		background:linen;
		margin-bottom:1rem;
		padding:15px 0;
		
	}
	.order li{
		text-align: center;
		font-size: 10px;	
	}
	.order_list{
		width:100%;
		background:orangered;
		display: flex;
		justify-content: space-between;
	}
	.order_list li,.order li{
		width:8%;
		text-align: center;
		padding:15px 0;
	}
	/*.order li:nth-child(1)
	{
		width:2%;
		margin-left:5px;
	}
	.order li:last-child{
		margin-right:5px;
	}*/
	.order_list li:nth-child(3),.order li:nth-child(3){
		width:20%;
	}
	.order_list li:nth-child(4),.order_list li:nth-child(5),.order_list li:nth-child(6),.order li:nth-child(4),.order li:nth-child(5),.order li:nth-child(6){
		width:14%;
	}
</style>