<template>
    <!-- 最外层div -->
    <div id="container">
	<!-- 定位 -->
        <div>{{LocationCity}}</div>
        <!-- 顶部搜索框 -->
        <div class="search">
            <!-- <router-link to="/my"> -->
                <input type="text" placeholder="请输入搜索内容">
                <p>搜索</p>
            <!-- </router-link> -->
        </div>
        <!-- 电梯导航栏 左侧-->
        <div class="goal-nav-left">
            <ul>
                <li @click="btn1">热门推荐</li>
                <li @click="btn2">北京</li>
                <li @click="btn3">上海</li>
                <li @click="btn4">深圳</li>
                <li @click="btn5">河北</li>
                <li @click="btn6">山东</li>
                <li @click="btn7">沈阳</li>
                <li @click="btn8">贵州</li>
                <li @click="btn9">河南</li>
                <li @click="btn10">湖北</li>
                <li @click="btn11">湖南</li>
                <li @click="btn12">宁夏</li>
            </ul>
        </div>

        <!-- 电梯导航栏右侧-->
        <div class="goal-nav-right">
           <mt-tab-container v-model="active">
               <mt-tab-container-item id="tab1">
                    <div id="tab-item1">
                        <div id="p-style">
                            <p>经典路线</p>
                        </div>
                        <div id="button-style">
                            <div>
                                <mt-button>故宫+颐和园</mt-button>
                            </div>
                            <div>
                                <mt-button>十渡+圆明园</mt-button>
                            </div>
                            <div>
                                <mt-button>欢乐谷</mt-button>
                            </div>
                            <div>
                                <mt-button>世界公园+天坛</mt-button>
                            </div>
                            <div>
                                <mt-button>八达岭长城</mt-button>
                            </div>
                            <div>
                                <mt-button>迪士尼度假区</mt-button>
                            </div>
                            <div>
                                <mt-button>东方明珠+外滩</mt-button>
                            </div>
                            <div>
                                <mt-button>野三坡</mt-button>
                            </div>
                        </div>
                    </div>
               </mt-tab-container-item>
               <mt-tab-container-item id="tab2">
                    <div id="p-style1">
                        <p>全部线路</p>
                        <img src="../../../static/goal-img/beijing1.gif"  alt="">
                    </div>
                    <div id="hot-goal">
                        <p>热门目的地</p>
                            <div id="hot-goal-item">
                                <img src="../../../static/goal-img/beijing5.gif" alt=""> 
                                故宫
                            </div>
                            <div id="hot-goal-item">
                                <img src="../../../static/goal-img/shidu.png" alt=""> 
                                十渡
                            </div>
                            <div id="hot-goal-item">
                                <img src="../../../static/goal-img/yiheyuan.png" alt=""> 
                                颐和园
                            </div>                  
                    </div>
                    <div id="all-goal">
                        <p>全部目的地</p>
                            <div>
                                <mt-button>故宫</mt-button>
                            </div>
                            <div>
                              <mt-button>颐和园</mt-button>
                            </div>
                            <div>
                              <mt-button>十渡</mt-button>
                            </div>
                            <div>
                              <mt-button>长城</mt-button>
                            </div>
                    </div>
               </mt-tab-container-item>
               <mt-tab-container-item id="tab3">
                    <div id="p-style1">
                        <p>全部线路</p>
                        <img src="../../../static/goal-img/sahnghai1.jpg" alt="">
                    </div>
                    <div id="hot-goal">
                        <p>热门目的地</p>
                            <div id="hot-goal-item">
                                <img src="../../../static/goal-img/shanghai4.jpg" alt=""> 
                                必去景点
                            </div>
                            <div id="hot-goal-item">
                                <img src="../../../static/goal-img/shanghai2.jpg" alt=""> 
                                夜上海
                            </div>
                            <div id="hot-goal-item">
                                <img src="../../../static/goal-img/shanghai3.jpg" alt=""> 
                                上海滩
                            </div>                  
                    </div>
                    <div id="all-goal">
                        <p>全部目的地</p>
                            <div>
                                <mt-button>迪士尼度假区</mt-button>
                            </div>
                            <div>
                                <mt-button>上海滩</mt-button>
                            </div>
                            <div>
                                <mt-button>东方明珠</mt-button>
                            </div>
                            <div>
                                <mt-button>外滩</mt-button>
                            </div>
                    </div>
               </mt-tab-container-item>
               <mt-tab-container-item id="tab4">
                    <div id="p-style1">
                        <p>全部线路</p>
                        <img src="../../../static/goal-img/shenzhen1.jpg" alt="">
                    </div>
                    <div id="hot-goal">
                        <p>热门目的地</p>
                            <div id="hot-goal-item">
                                <img src="../../../static//goal-img/shenzhen2.jpg" alt=""> 
                                海滩
                            </div>
                            <div id="hot-goal-item">
                                <img src="../../../static//goal-img/shenzhen3.jpg" alt=""> 
                                必去景点
                            </div>
                            <div id="hot-goal-item">
                                <img src="../../../static//goal-img/shenzhen4.jpg" alt=""> 
                                日出
                            </div>                  
                    </div>
                    <div id="all-goal">
                        <p>全部目的地</p>
                            <div>
                                <mt-button>海上世界</mt-button>
                            </div>
                            <div>
                                <mt-button>梧桐山</mt-button>
                            </div>
                            <div>
                                <mt-button>世界之窗</mt-button></div>
                            <div>
                                <mt-button>必去城市</mt-button>
                            </div>
                    </div>
               </mt-tab-container-item>
               <!-- 河北 -->
               <mt-tab-container-item id="tab5">
                    <div id="p-style1">
                        <p>全部线路</p>
                        <img src="../../../static/goal-img/hebei1.jpg" alt="">
                    </div>
                    <div id="hot-goal">
                        <p>热门目的地</p>
                        <div id="hot-goal-item">
                           <img src="../../../static/goal-img/hebei2.jpg" alt="">
                            山
                        </div>
                         <div id="hot-goal-item">
                           <img src="../../../static/goal-img/hebei3.jpg" alt="">
                            云海
                        </div>
                         <div id="hot-goal-item">
                           <img src="../../../static/goal-img/hebei1.jpg" alt="">
                            北戴河
                        </div>                  
                    </div>
                    <div id="all-goal">
                        <p>全部目的地</p>
                            <div>
                                <mt-button>必去景点</mt-button>
                            </div>
                            <div>
                                <mt-button>爬山</mt-button>
                            </div>
                            <div>
                                <mt-button>观景</mt-button>
                            </div>
                           
                    </div>
               </mt-tab-container-item>
               <!-- 山东 -->
               <mt-tab-container-item id="tab6">
                    <div id="p-style1">
                        <p>全部线路</p>
                        <img src="../../../static/goal-img/shandong1.jpg" alt="">
                    </div>
                    <div id="hot-goal">
                        <p>热门目的地</p>
                            <div id="hot-goal-item">
                               <img src="../../../static/goal-img/shandong1.jpg" alt="">
                                泰山
                            </div>
                            <div id="hot-goal-item">
                                <img src="../../../static/goal-img/shandong2.jpg" alt="">
                                五岳之尊
                            </div>
                            <div id="hot-goal-item">
                                <img src="../../../static/goal-img/shandong3jpg.jpg" alt="">
                                必去景点
                            </div>                  
                    </div>
                  
               </mt-tab-container-item>
               <!-- 沈阳 -->
               <mt-tab-container-item id="tab7">
                    <div id="p-style1">
                        <p>全部线路</p>
                        <img src="../../../static/goal-img/hebei1.jpg" alt="">
                    </div>
                    <div id="hot-goal">
                        <p>热门目的地</p>
                            <div id="hot-goal-item">
                               <img src="../../../static/goal-img/shandong1.jpg" alt="">
                                
                            </div>
                            <div id="hot-goal-item">
                                <img src="../../../static/goal-img/shandong2.jpg" alt="">
                             
                            </div>
                            <div id="hot-goal-item">
                                <img src="../../../static/goal-img/shandong3jpg.jpg" alt="">
                               
                            </div>                  
                    </div>
                  
               </mt-tab-container-item>
               <!-- 贵州 -->
               <mt-tab-container-item id="tab8">
                    <div id="p-style1">
                        <p>全部线路</p>
                      <img src="../../../static/goal-img/hebei1.jpg" alt="">
                    </div>
                     <div id="hot-goal">
                        <p>热门目的地</p>
                            <div id="hot-goal-item">
                               <img src="../../../static/goal-img/shandong1.jpg" alt="">
                              
                            </div>
                            <div id="hot-goal-item">
                                <img src="../../../static/goal-img/shandong2.jpg" alt="">
                                
                            </div>
                            <div id="hot-goal-item">
                                <img src="../../../static/goal-img/shandong3jpg.jpg" alt="">
                                
                            </div>                  
                    </div>
                   
               </mt-tab-container-item>
               <!-- 河南 -->
               <mt-tab-container-item id="tab9">
                    <div id="p-style1">
                        <p>全部线路</p>
                      <img src="../../../static/goal-img/hebei1.jpg" alt="">
                    </div>
                      <div id="hot-goal">
                        <p>热门目的地</p>
                            <div id="hot-goal-item">
                               <img src="../../../static/goal-img/shandong1.jpg" alt="">
                              
                            </div>
                            <div id="hot-goal-item">
                                <img src="../../../static/goal-img/shandong2.jpg" alt="">
                               
                            </div>
                            <div id="hot-goal-item">
                                <img src="../../../static/goal-img/shandong3jpg.jpg" alt="">
                               
                            </div>                  
                    </div>
                   
               </mt-tab-container-item>
               <!-- 湖北 -->
               <mt-tab-container-item id="tab10">
                    <div id="p-style1">
                        <p>全部线路</p>
                         <img src="../../../static/goal-img/hebei1.jpg" alt="">
                    </div>
                     <div id="hot-goal">
                        <p>热门目的地</p>
                            <div id="hot-goal-item">
                               <img src="../../../static/goal-img/shandong1.jpg" alt="">
                           
                            </div>
                            <div id="hot-goal-item">
                                <img src="../../../static/goal-img/shandong2.jpg" alt="">
                                
                            </div>
                            <div id="hot-goal-item">
                                <img src="../../../static/goal-img/shandong3jpg.jpg" alt="">
                                
                            </div>                  
                    </div>
                   
               </mt-tab-container-item>
               <!-- 湖南 -->
               <mt-tab-container-item id="tab11">
                    <div id="p-style1">
                        <p>全部线路</p>
                    <img src="../../../static/goal-img/hebei1.jpg" alt="">
                    </div>
                     <div id="hot-goal">
                        <p>热门目的地</p>
                            <div id="hot-goal-item">
                               <img src="../../../static/goal-img/shandong1.jpg" alt="">
                               
                            </div>
                            <div id="hot-goal-item">
                                <img src="../../../static/goal-img/shandong2.jpg" alt="">
                        
                            </div>
                            <div id="hot-goal-item">
                                <img src="../../../static/goal-img/shandong3jpg.jpg" alt="">
                                
                            </div>                  
                    </div>
                    
               </mt-tab-container-item>
               <!-- 宁夏 -->
               <mt-tab-container-item id="tab12">
                    <div id="p-style1">
                        <p>全部线路</p>
                      <img src="../../../static/goal-img/hebei1.jpg" alt="">
                    </div>
                      <div id="hot-goal">
                        <p>热门目的地</p>
                            <div id="hot-goal-item">
                               <img src="../../../static/goal-img/shandong1.jpg" alt="">
                               
                            </div>
                            <div id="hot-goal-item">
                                <img src="../../../static/goal-img/shandong2.jpg" alt="">
                               
                            </div>
                            <div id="hot-goal-item">
                                <img src="../../../static/goal-img/shandong3jpg.jpg" alt="">
                                
                            </div>                  
                    </div>
                  
               </mt-tab-container-item>
           </mt-tab-container>     
        </div>      
    </div>
</template>
<script>
export default {
    data(){
        return{
            active:"tab2",
	        LocationCity:"正在定位",
        }
    },
    // 定位开始
    created(){
        this.city()//触发获取城市方法
    },
    // 点击切换面板事件
    methods:{
	city(){    //定义获取城市方法
            const geolocation = new BMap.Geolocation();
            var _this = this
            geolocation.getCurrentPosition(function getinfo(position){
                let city = position.address.city;             //获取城市信息
                let province = position.address.province;    //获取省份信息
                _this.LocationCity = city
            }, function(e) {
                _this.LocationCity = "定位失败"
            }, 
            {provider: 'baidu'});        
        },
        // 定位结束
        btn1(){
            this.active="tab1"
        },
        btn2(){
            this.active="tab2"
        },
        btn3(){
            this.active="tab3"
        },
        btn4(){
            this.active="tab4"
        },
        btn5(){
            this.active="tab5"
        },
        btn6(){
            this.active="tab6"
        },
        btn7(){
            this.active="tab7"
        },
        btn8(){
            this.active="tab8"
        },
        btn9(){
            this.active="tab9"
        },
        btn10(){
            this.active="tab10"
        },
        btn11(){
            this.active="tab11"
        },
        btn12(){
            this.active="tab12"
        },
    }
}
 
</script>
<style scoped>
    #container{
        position: relative;
        overflow: hidden;
    }
    .search{
        margin-top:10px;
        margin-left:10px;
    }
    .search input{
        width: 80%;
        height:25px;
        border:1px solid #ccc;
        float: left;
        border-radius: 20px;
        background: #ddd;
         padding-left: 10px;
        /* margin-top: 10px;  */
        /* 底部线 */
    }
    .search p{
        padding-top: 5px;
        padding-left: 300px; 
        
    }
    /* .search{
        border-bottom: 1px solid #ccc;
    } */
    /* 导航栏左侧样式 */
    .goal-nav-left{
        margin-top:30px;
        width: 30%;
        height: 100%;
        background-color: #ccc; 
        overflow: hidden;
		text-align: center;
        }
    .goal-nav-left ul{
        line-height: 25px;
    }
    .goal-nav-left ul li{
        padding: 8px 0px 8px 0px;
        vertical-align:middle; 
        /*border-left: 1px solid #f4f4f4;*/
    }
    .goal-nav-left ul li:hover{
        background-color: #fff;
    }
    /*导航栏右侧样式*/
    .goal-nav-right{
        width: 70%;
        height: 100%;
        float: right;
        position: absolute;
        top:49px; right:0;
        overflow: hidden;
        position: fixed;
        /*background: red;*/
        margin-top: 10px;
    }
   #nav-right-tab1,#nav-right-tab2,#nav-right-tab3 {
       width: 100%;
       height: 100%;
   }
    /* 按钮颜色 */
    button{
        background-color:#ccc;
        padding:5px;
        width:45%;
        height:30px; 
        border-radius:15px;
        margin-top:5px;
        margin-left:5px;
        border:0;
        outline:none;
        float:left;
        font-size: 14px;
        color:black;
    }
    /* 热门推荐样式 */ 
    /* p标签样式 */
    #p-style{
        font-size:16px;
        margin-left:0;    
    } 
    #p-style p{
        padding-left:16px;
    }
    /* 城市样式 */
    #hot-goal-item{
        width:33%;
        float:left;
        text-align:center;
    }
    /*全部城市样式*/
    #all-goal mt-button{
        margin-left:10px;
    }
    /*  */
    #p-style1 img{
        width: 33%;
        height: 60px;
    }
    #hot-goal img{
        width: 96%;
        height: 60px;
    }
</style>
