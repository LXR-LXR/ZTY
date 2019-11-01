<template>
	<!-- MyCart -->
	<div id="myCart">
		<ul id="cartList">
			<!-- 声明数组cartText,利用v-for自动生成cart -->
			<li id="cartItem" v-for="(item,i) of cartText" :key="i">
				<!-- 为空的div标签绑定函数throwValue用来向跳转页面并传递val值 -->
				<router-link :to="/MyOrder/+item.val+'/'+i+'/'+uid">
					<!-- 将src修改为变量，通过数组cartText保存其对应的路径 -->
					<img :src="item.icon" id="cartIcon">
					<!-- 通过数组cartText动态加载p标签内的内容 -->
					<p>{{item.title}}</p>
				</router-link>
			</li>
		</ul>
	</div>
</template>
<script>
	export default{
		data(){
			return{
				cartText:[/*声明数组cartText，其中icon储存的是图片的路径，title存储的是显示的文字，val储存的是页面跳转时将要传递的值*/
		          {icon:require("../../../static/myimg/mycart/order.png"),title:"全部订单",val:"order"},
		          {icon:require("../../../static/myimg/mycart/pay.png"),title:"待支付",val:"pay"},
		          {icon:require("../../../static/myimg/mycart/trip.png"),title:"待出行",val:"trip"},
		          {icon:require("../../../static/myimg/mycart/comment.png"),title:"待评价",val:"comment"}
	        	]
			}
			
		},
		props:["uid"]
	}
</script>
<style>
	#myCart{
		margin:0 auto;
		width:95%;
		height:80px;
		border-radius:8px;
		background:#fff;
		box-shadow:0px 0px 4px 2px rgb(235,234,234);
	}
	#cartList{
		display:flex;
		justify-content:space-around;
	}
	#cartItem p{
		color:rgb(155,155,155);
		font-size:12px;
		display:block;
	}
	#cartItem img{
		width:30px;
		height:30px;
		margin-top:15px;
	}
</style>