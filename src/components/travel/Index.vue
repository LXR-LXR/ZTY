<template>  
<div>
   <div class="d1">
        <div class="header_bar">
            <input type="text" autofocus x-webkit-speech placeholder="请输入搜索内容">
            <img src="../../../static/index_pic/icon/mag_icon.png" class="msg_icon">
            <span class="right_icon"><img src="../../../static/index_pic/icon/paper_icon.png"></span>
            <span class="right_icon"><img src="../../../static/index_pic/icon/phone_icon.png"></span>
        </div>
        <div class="search_referral">
            <div class="search_history">
                <div class="search_bar">
                    <div>
                        <p>历史搜索</p>
                    </div>
                    <div>
                        <a href="">
                            <p class="right_del"><img src="../../../static/index_pic/icon/del_icon.png">删除</p>
                        </a>
                    </div>
                </div>
                <div>
                    <div>
                        <mt-button class="bar_btn" size="small">搜索历史</mt-button>
                    </div>
                </div>
            </div>
            <div class="hot_search">
                <p>热门搜索</p>
            </div>
            <div class="hot_box">
                <div>
                    <mt-button class="bar_btn" size="small">泰国</mt-button>
                </div>
                <div>
                    <mt-button class="bar_btn" size="small">好莱坞</mt-button>
                </div>
                <div>
                    <mt-button class="bar_btn" size="small">皇后镇</mt-button>
                </div>
                <div>
                    <mt-button class="bar_btn" size="small">澳大利亚</mt-button>
                </div>
                <div>
                    <mt-button class="bar_btn" size="small">普吉岛</mt-button>
                </div>
                <div>
                    <mt-button class="bar_btn" size="small">北海道</mt-button>
                </div>
            </div>
        </div>
    </div>
    <div class="main_part">
        <div class="content">
            <div class="carousel">
                <mt-swipe :auto="4000" :show-indicators="true">
                    <mt-swipe-item >
                        <img src="@../../../static/index_pic/pic/jhk-02.jpg" />
                    </mt-swipe-item>
                    <mt-swipe-item >
                        <img src="@../../../static/index_pic/pic/jhk-01.jpg" />
                    </mt-swipe-item>
                    <mt-swipe-item >
                        <img src="@../../../static/index_pic/pic/jhk-03.jpg" />
                    </mt-swipe-item>
                    <mt-swipe-item >
                        <img src="@../../../static/index_pic/pic/jhk-04.jpg" />
                    </mt-swipe-item>
                    <mt-swipe-item >
                        <img src="@../../../static/index_pic/pic/jhk-05.jpg" />
                    </mt-swipe-item>
                </mt-swipe>
            </div> 
           <div class="nav_bar">
                <div class="nav_box">
                    <ul class="nav_bar_ul" >
                       
                        <li v-for="(item,i) of item" :key='i'>
                         <router-link :to="/tuijian/+item.tid+'/'+uid">     
                        <img :src="item.icon" ><p> {{item.text}} </p> 
                         </router-link> 
                        </li>
                                  
                          
                    </ul>
                </div>
                <div>
                    <ul class="nav_bar_ul">
                        <a href="#"> 
                            <li><img src="@../../../static/index_pic/icon/writ.png" ><p> 境外门票 </p> </li>
                        </a> 
                        <a href="#"> 
                            <li><img src="@../../../static/index_pic/icon/airpo.png" ><p> 接送机 </p> </li>
                        </a> 
                        <a href="#"> 
                            <li><img src="@../../../static/index_pic/icon/taxt.png" ><p> 境外用车 </p> </li>
                        </a> 
                        <a href="#"> 
                            <li><img src="@../../../static/index_pic/icon/visa.png" ><p> 签证 </p> </li>
                        </a> 
                        <a href="#"> 
                            <li><img src="@../../../static/index_pic/icon/feature.png" ><p> 特色体验 </p> </li>
                        </a> 
                    </ul>
                </div>
                <div class="show_box">
                   <a href="javascript:;"><img src="@../../../static/index_pic/pic/jhk-02(2).jpg"></a>
                </div>
                <div class="promote">
                    <div class="pro_1f">
                        <div>
                            <h3>新人超值</h3>
                        </div>
                        <div class="f1_R">
                            <!-- <a href=""> -->
                                <!-- <button @click="loadMore">查看全部</button>
                                <h3>＞</h3> -->
                            <!-- </a> -->
                        </div>
                    </div>
                    <div class="pro_2f">
                        <div class="left_box">
                            <img src="@../../../static/index_pic/pic/jhk-07.jpg">
                        </div>
                        <div class="right_box">
                            <div class="up_box">
                                <div class="up_box_pic">
                                    <img src="@../../../static/index_pic/pic/jhk-08.jpg" >
                                </div>
                            </div>
                            <div class="bottom_box">
                                    <img src="@../../../static/index_pic/pic/jhk-09.jpg">
                            </div>
                        </div>
                    </div>
                     <div class="pro_1f">
                        <div>
                            <h3>热门目的地</h3>
                        </div>
                        <div class="f1_R">
                            <router-link :to="/home/+uid+'/'+uid1">
                                <p>查看全部</p>
                                <h3>＞</h3>
                            </router-link>
                        </div>
                    </div>
                    <div class="hot_bourn">
                       <mt-navbar v-model="selected" >
                            <mt-tab-item id="1">北京</mt-tab-item>
                            <mt-tab-item id="2">上海</mt-tab-item>
                            <mt-tab-item id="3">深圳</mt-tab-item>
                          
                        </mt-navbar>

                        <!-- tab-container 面板 -->
                        <mt-tab-container v-model="selected">
                        <mt-tab-container-item id="1">
                            <div class="goal-img">
                                <div class="goal-img-item" >
                                <img src="../../../static/goal-img/beijing1.gif" alt="">
                                <span>北京</span>
                                </div>
                                 <div class="goal-img-item" >

                                <img src="../../../static/goal-img/beijing2.jpg" alt="">
                                 <span>北京</span>
                                 </div>
                                  <div class="goal-img-item" >

                                <img src="../../../static/goal-img/beijing5.gif" alt="">
                                 <span>北京</span>
                                 </div>
                               
                            </div>
                        </mt-tab-container-item>
                          <mt-tab-container-item id="2">
                                <div class="goal-img">
                                <div class="goal-img-item" >
                                <img src="../../../static/goal-img/sahnghai1.jpg" alt="">
                                <span>东方明珠</span>
                                </div>
                                 <div class="goal-img-item" >

                               <img src="../../../static/goal-img/shanghai4.jpg" alt="">
                                 <span>经典景点</span>
                                 </div>
                                  <div class="goal-img-item" >

                              <img src="../../../static/goal-img/shanghai2.jpg" alt="">
                                 <span>夜上海</span>
                                 </div>
                                </div>
                          </mt-tab-container-item>
                       
                          <mt-tab-container-item id="3">
                           
                             <div class="goal-img">
                                <div class="goal-img-item" >
                                <img src="../../../static/goal-img/shenzhen1.jpg" alt="">
                                <span>经典</span>
                                </div>
                                 <div class="goal-img-item" >

                               <img src="../../../static/goal-img/shenzhen4.jpg" alt="">
                                 <span>日出</span>
                                 </div>
                                  <div class="goal-img-item" >

                              <img src="../../../static/goal-img/shenzhen2.jpg" alt="">
                                 <span>海滩</span>
                                 </div>
                                </div>      
                         </mt-tab-container-item>
                      
                       
                         </mt-tab-container>
                    
                    
                    </div>

                    <!-- ##########首页 -->
                    <div class="pro_1f">
                        <div>
                            <h3>新人超值专享</h3>
                        </div>
                    </div>
                    <div class="hot_sell">
                       <div v-for='(item,i) of list' :key='i' class="every">
                         
                                <div class="hot_pic">
                                  
                                    <router-link :to="/Detail/+item.href+'/'+uid" class="aaa">
                                       <img :src="'https://ranxiaomozty.applinzi.com/'+item.pic">
                                   </router-link>
                                </div>
                                <div class="hot_box">
                                     <router-link :to="/Detail/+item.href+'/'+uid" class="aaa">
                                    <p class="hot_title">{{item.title}} </p>
                                    <p class="hot_sco">{{item.subtitle}}分</p>
                                    <div class="hot_info">
                                        <span class="hot_pri">￥{{item.price.toFixed(2)}}</span>
                                        <span class="hot_up">/起</span>
                                        <span class="sell_info">{{item.people}}人出行</span>
                                    </div>
                                     </router-link>
                                </div>
                       </div>
                           <button @click="loadMore" class="btn">下滑查看更多</button>
                    </div>
                </div>
            </div>
        </div>
         
    </div>
</div>
</template>

<script>

export default {
   data:function(){
        // 存放服务端查询成功得到的结果集result select 成功的
        return {
            list:[],  //商品列表数组
            pno:0,//页码（第几页）
            selected:'1',
            item:[
                {tid:1,icon:require('../../../static/index_pic/icon/Ind.png'),text:'推荐'},
                {tid:2,icon:require('../../../static/index_pic/icon/local.png'),text:'当地玩乐'},
                {tid:3,icon:require('../../../static/index_pic/icon/ship.png'),text:'邮轮游'},
                {tid:4,icon:require('../../../static/index_pic/icon/roll.png'),text:'精品小团'},
                {tid:5,icon:require('../../../static/index_pic/icon/bard.png'),text:'个性定制'}
               
            ],
            uid1:"tab2"
        }
    },
 // 页面加载中调用ajax请求
    created() {
        this.loadMore();
    },
    props:["uid"],
    methods:{ 
      loadMore(){     // 加载更多
            // 1.创建url
            var url="product";
            // 2.创建obj参数
            this.pno++;
            var obj={pno:this.pno};
            // 3.发送axios请求
            this.axios.get(url,{params:obj}).then(res=>{
            // res中有响应结果码 还有data code；1 data返回结果集 四个商品[{},{},]
            // 4.接收返回结果并且显示
            // this.list = res.data.data;
            // 拼接上一页和下一页的数组  concat
            var rows=this.list.concat(res.data.data);
            this.list=rows;         
            }) 
        },
}


 }

</script>

<style scoped>

/* body{
    position: relative;
} */
.aaa{
    display: block;
}
.goal-img{
    display: flex;
    justify-content: space-around;
    margin-top:3%;
}
/* .goal-img  img{
    width: 30%;
    height: 80%;;
} */
.goal-img-item{
    margin-top: 3%;
    display: flex;
    justify-content: space-between;
    flex-direction: column;
    align-items: center;
    padding: 2%;
}
.goal-img-item img{
   width: 100%;
   /* margin-left: 2%; */
    height: 100%;
}
.main_part{
    font-size: 12px;
    /* position: relative; */
}
.header_bar{
    background:rgb(39, 123, 202);
    display: flex;
    justify-content: space-around;
    padding:10px 15px;
    padding-top:35px;
}
.header_bar input{
    border: 1px solid #fff;
    height: 30px;position: relative;
    width: 230px;
    /* margin-right: 10px; */
    padding-left: 35px;
    border-radius: 25px;
    outline: none;
}
 .d1{
    width:100%;
    position: fixed;
    z-index: 1;
    top:0;
}
.search_referral{
    display: none;
    width:100%;
    margin:10px;
    font-size: 14px;
    position: absolute;
    top:100px;
    left:0;
    right:0px;
}


.msg_icon{
    width: 20px;
    position: absolute;
    left: 25px;
    top:40px;
}
.right_icon img{
    width:30px;
    height:30px;
    margin-left:10px;
}
.hot_search{
        margin-top:20px;
}
.search_bar{
    width:90%;
    display: flex;
    justify-content: space-between;
}
.bar_btn{
    margin:15px;
    margin:10px 8px;
    font-size: 12px;
}
.hot_box{
    width:90%;
    display:flex;
    flex-wrap:wrap;
}


/*-----------------*/
.content{
    margin:15px 10px;
    width:auto;
    margin-top:93px;
}
    a{
        text-decoration:none; 
    }
    ul{
        list-style: none;
    }
/* carousel */
    .carousel{
        height:150px;
        margin-bottom:8%;
    }
    .carousel img{
        width:100%;
        height:150px;
        border-radius: 12px;
    } 
/* nav_bar */
    .nav_bar_ul{
        display: flex;
        justify-content: space-around;
        text-align: center;
        margin-bottom:0 5px 15px 5px;
        
    }
    .nav_box{
        margin-bottom:5%;
    }
    .nav_box a{
    color:black;
    }
    .nav_bar ul p{
        margin-top:5px;
    }
    /* 广告位 */
    .show_box{
       display: flex;
        margin:6% 2%;
    }
    .show_box img{
        width:100%;
        height:100%;
         border-radius:18px;
        
    }

    /* promote */
.pro_1f{
    display: flex;
    justify-content: space-between;
}
.f1_R a{
   display:flex;
   align-items: center;
}
.pro_2f{
   display:flex;
   border:1px #66666629 solid;
   border-radius: 8%;
   padding: 5%;
   margin: 10px 0 20px 0;
}
.pro_2f img{
     border-radius: 4%;
}
.f1_R{
      margin-left: 5px;
}
.left_box.right_box{
    width:100%;
}
.right_box{
    margin-left: 15px;
}
.up_box_pic{
     margin-bottom:10px;
}
.pro_2f img{
    width:100%;
    height: 100%;
}
.hot_bourn{
    border:1px #66666629 solid;
   border-radius: 8%;
    margin: 15px 0;
}
.hot_nav{
    display: flex;
    justify-content:space-around;
    color: rgb(39, 123, 202);
    margin: 15px;
}
.bourn_info img{
    width:100%;
    height: 100%;
    margin-bottom:-70px;
}
.bourn_info{
    display:flex;
    justify-content: space-around;
    padding:0 2%;
}
.bourn_info div{
    text-align: center;
   
    /* display: flex; */
}
.bourn_info ul {
 margin:0 5% 8% 5%;
}
.bourn_info li{
   margin-bottom: 14%;
}
#first_text{
    color:#fff;
    font-size:15px;
}
#net_text{
    color:#fff;
    font-size: 10px;
}
.last_text{
   color:black;
    font-size:12px;
}
/*###########详情*/

/* hot_sell */
/* .hot{
    display: flex;
     width:100%;
    align-items: center;
} */

/*大*/
.hot_sell{
    width:100%;
    display: flex;
    margin-top:30px;
    margin-bottom:10px;
    flex-direction: column
    /* position: relative; */
}
/*每个*/
.every{
    display: flex;
    flex-direction: row;
    width: 100%;
    align-items: center;
    margin-bottom: 5%;
    border: 1px #66666629 solid;
}
.hot_box{
    width: 60%;
    /* margin:2%  2px; */
    height:113px;
    /* display: block; */
    display: flex;
    flex-direction: row;
    
    /* justify-content: space-around; */
    margin-bottom: 2%;
    padding-left: 5%;
    /* padding-left:44%; */
    border-radius: 8px;
}
.hot_pic{
    width:40%;
    /* position:absolute; */
    /* left: 0; */
    /* top:5px; */
}
.hot_pic img{
    width:100%;
    height:90%;
    border-radius: 15px;
}


.hot_title{
    padding-top: 5px;
    width: 100%;
    font-size: 13px;
}
.hot_sco{
     /* padding-left: 2%; */
    padding-top: 5px;
    width: 100%;
    /* float:right; */
    color:orangered;
}
.hot_info{
   /* margin-top: 20px; */
    /* padding-top: 5px; */
    width: 100%;
}
.hot_pri{
    color: red;
    font-size: 20px;
     /* padding-left: 2%; */
}
.hot_up{
    font-size:8px;
    /* margin-right:5px; */
}
.sell_info{
    padding-right:1%；
}
.btn{
    border:0;
    background:#277bca;
    color:white
}
</style>
