<template>
    <div id="container">
       <div class="page-head">
            <img src="../../../static/img/gengduo.png" alt="" class="left-img">
            <div class="right-head">
            <div class="searchdiv">
                <img src="../../../static/img/fenxiangmingpian.png" style="width:25px;" />
            </div>
            <div class="searchdiv" style="margin-left:20px;">
                <img src="../../../static/img/gengduo_1.png" style="width:25px;margin-right:15px;"/>
            </div>
            </div>
        </div>
        <div id="mt-swap" v-for='(item1,item) of list' :key='item.i'>
            <mt-swipe :auto="4000" class="mt-swipe" :show-indicators="false">
                <mt-swipe-item>
                    <img :src="'https://ztyranxiaomo.applinzi.com/'+item1.p_ban1"  alt="">
                </mt-swipe-item>
                <mt-swipe-item>
                    <img :src="'https://ztyranxiaomo.applinzi.com/'+item1.p_ban2" alt="">
                </mt-swipe-item>
                <mt-swipe-item>
                    <img :src="'https://ztyranxiaomo.applinzi.com/'+item1.p_ban3" alt="">
                </mt-swipe-item>
            </mt-swipe>
        </div>
        <div class="detail" v-for="(item,index) of list" :key='index' >
            <div class="score">
                <ul>
                    <li>{{item.subtitle}}分</li>
                    <li>{{item.people}}人出行</li>
                </ul>
                <h3>{{item.title}}</h3>
                <p>
                    <span>￥401.20</span>
                    <span>/起</span>
                </p>
                <p>新用户下单立减￥4.01起</p>
            </div>
            <div class="recommend">
                <p>
                    <img src="../../../static/img/zan.png" alt="">稀饭推荐
                </p>
                <p>
                    <img src="../../../static/img/xingxing.png" alt="">
                    (半日)【巡航观洋】新西兰 基督城 "黑猫号"观海豚半日游(半日)【巡航观洋】新西兰 基督城 "黑猫号"观海豚半日游
                </p>
                <p>
                    <img src="../../../static/img/xingxing.png" alt="">
                    (半日)【巡航观洋】新西兰 基督城 "黑猫号"观海豚半日游(半日)【巡航观洋】新西兰 基督城 "黑猫号"观海豚半日游
                </p>
              
            </div>
            <mt-navbar v-model="selected" class="mt-navbar">
                <mt-tab-item id="tab1">1天行程</mt-tab-item>
                <mt-tab-item id="tab2">费用明细</mt-tab-item>
                <mt-tab-item id="tab3">预订须知</mt-tab-item>
            </mt-navbar>

            <!-- tab-container -->
            <mt-tab-container v-model="selected">
                <mt-tab-container-item id="tab1">
                    <div class="tab1">
                        <p>行程概要</p>
                        <ul>
                            <li>
                                <img src="../../../static/img/hanglixiang.png" alt="">
                                1天行程
                            </li>
                            <li>
                                <img src="../../../static/img/shanmai.png" alt="">
                                3个景点
                            </li>
                            <li>
                                <img src="../../../static/img/_shiye_quanqiu.png" alt="">
                                英语&中文
                            </li>
                        </ul>

                        <hr>
                         <div class="xingcheng" v-for="(item,i) of list" :key="i">
                            <p class="title">{{item.title}}</p>
                            <span>概述</span>
                             <div class="desc">{{item.details}} </div>
                             <div class="line"></div>
                             <h4>景点介绍</h4>
                      <img :src="'https://ztyranxiaomo.applinzi.com/'+item.p_img"  />
                
                   </div>
                     </div>
                </mt-tab-container-item>
                <mt-tab-container-item id="tab2">
                    
                        <p>费用明细</p>
                   
                </mt-tab-container-item>
                <mt-tab-container-item id="tab3">
                    子面板3
                </mt-tab-container-item>
            </mt-tab-container>
         
            <div class="footer">
                <ul>
                    <li>
                        <img :src="click?'../../../static/img/shoucang_gaoliang.png':'../../../static/img/collection.png'" @click="img" alt="">
                        收藏
                    </li>
                    <li>
                        <img src="../../../static/img/dianhua.png" alt="">
                        电话咨询
                    </li>
                    <li>    
                        <img src="../../../static/img/zixun.png" alt="">
                        在线咨询
                    </li>
                </ul>
                <button  @click="toOrder">
                    立即预定
                    
                </button>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            selected:"tab1",
            click:false,
            // 数据库返回的数据
            list:[],
        }
    },
    // 组件传参
    props:["lid","uid"], //{ ..., props:true}
    
    
    created(){
    // 创建url /detail
    // 参数 lid
    var url='detail'
    var obj={lid:this.lid}
     this.axios.get(url,{params:obj}).then(res=>{
         console.log('这是ajax返回的res666');
                console.log(res);
                this.list=res.data.data;
                console.log('这是商品详情list');
                console.log(this.list)
                if(res.data.code==-1){
            // 6.如果没有登录提示
                // this.$toast("请登录");
                }
 })
  },
    methods:{
       toOrder(){
            var uid=parseInt(this.uid);
            uid=isNaN(uid)
            if(uid)
            {
                this.$router.push('/loginMethods');
            }
            else
            {
                console.log(11111111111);
                this.$router.push(/order/+this.lid+'/'+this.uid);
            }
        },
        img(){
            if(this.click)
            {
                this.click=false;
            }
            else
            {
                this.click=true;
            }
        }
    }
}
</script>
<style scoped>
   .xingcheng{
     display: flex;
     flex-direction: column;
     justify-content: start;
     border-left: 3px solid #ccc;
     /* align-items: center; */
     margin-left: 5%;
     padding: 5%;
   }
    .xingcheng .line{
        width: 1px;
        height: 100%;
        color: #ccc
    }
     .xingcheng .desc{
          margin:2% auto;
     }
      .xingcheng .title{
          font-size: 16px;
          color: #000;
          /* margin-bottom:  */
      }
      .xingcheng img{
          width: 80%;
          margin: 2% ;
      }
    *{margin:0;padding:0}  
    /*底部撑开*/
    /* #container{
        display: flex;
        justify-content: center;
        overflow: hidden;
        padding-bottom:70px;
    } */
    /*设置轮播图的高宽*/
    #mt-swap{
        width:100%;
        height:225px;
    }
    .mt-swipe img{
        width:100%;
        height:225px;
    }
    
    .page-head{
     display: flex;
     position: fixed;
     z-index:999;
     width:100%;
     justify-content: space-between;
     align-items: center;
     padding-left:7px;
     padding-right:7px;
     height:48px;
     color:#fff;
     font-size:18px;
   }
   .left-img{
       width:25px;
       visibility: visible;
   }
   .right-head{
     display: flex;
   }
   .searchdiv{
     display: flex;
     align-items: center;
     height:48px;
   }
   .detail{
       width:100%;
       width:100%;
       background:#f6f8fa;
       padding-bottom:70px;
   }
   .score{
       width:100%;
       background:#fff;
   }
   .score>ul,.score p:nth-child(3){
       display: flex;
       justify-items: center;
       justify-content: space-around;
       width:40%;
   }
   .detail>ul>li{
       width:45%;
       font-size:14px;
   }
   ul{
       list-style:none;
   }
   .score p:nth-child(2){
       margin-top:10px;
       text-align: justify;
       word-break: break-all;
   }
   .score p:nth-child(3){
       font-size: 13px;
       color:orange;
       width:30%;
   }
   .score p:nth-child(3) span:nth-child(1){
       font-size:22px;
   }
   .score p:nth-child(3) span:nth-child(2){
       text-align: center
   }
   .score p:nth-child(4){
       color:coral;
       font-size: 13px;
       width:40%;
       margin-top:5px;
   }
   .recommend{
       margin:20px 0 15px;
       width:100%;  
       background:#fff;
       padding:5px 0;
       
   }
   .recommend p:nth-child(1){
       font-size:13px;
       width:20%;
       margin-top:5px; 
       color:deepskyblue;
       margin-bottom:4px; 
   }
   .recommend p:nth-child(1) img{
       width:10px;
       margin-right:3px;
      
       
   }
   .recommend p:not(:nth-child(1)){
       font-size:11px;
       color:deepskyblue;
       text-align: justify;
       word-break: break-all;
       padding:0 10px;
   }
   .recommend p:not(:nth-child(1)) img{
       width:5px;
   }
   .mt-navbar{
       padding-bottom:3px !important;
   }
   .tab1 p:nth-child(1){
       text-align: justify;
       word-break: break-all;
       margin-top:10px; 
   }
   .tab1 ul{
       display: flex;
       justify-items:center;
       justify-content: space-around;
       width:100%;
       margin:15px 0 8px -9px;
   }
   .tab1 ul li{
       width:20%;
       font-size: 14px;
       text-align:center;
   }
   .tab1 ul li img{
       width:30px;  
       display: block;
       margin: 0 auto;
   }
   .tab1 hr{
       width:90%;
       background: #000;
       margin:0 auto 20px;
   }
   .tab1 p:nth-child(4){
       text-align: justify;
       word-break: break-all;
       margin-top:10px; 
   }
   .footer{
       width:100%;
       background:#fff;
       display:flex;
       position: fixed;
       bottom:0;
       z-index: 5;
       justify-content: space-between;
       justify-items: center;
       padding:8px 0;
   }
   .footer ul{
       width:50%;
       display: flex;
       justify-content: space-around;
       justify-items: center;

   }
   .footer ul li{
       width:30%;
       font-size: 13px;
       text-align:center;
   }
   .footer ul li:nth-child(2){
       margin-left:-7px;
   }
   .footer ul li img{
       width:25px;
       display: block;
       margin:0 auto;
   }
   .footer button{
       width:35%;
       background:tomato;
       color:#fff;
       margin-right:15px;
       border-radius:5px;
       border:0
   }
</style>