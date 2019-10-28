<template>
    <div class="container1">
        <!-- s搜索框 -->
        <div> 
               <router-link to="" slot="left">
        <mt-button icon="back" @click="$router.back(-1)"></mt-button>
      </router-link>
             <mt-search v-model="value" cancel-text="取消" placeholder="搜索" fixed></mt-search>
        </div>
      
        <!-- navbar 导航 -->
  <mt-navbar v-model="selected" >
  <mt-tab-item id="1">推荐</mt-tab-item>
  <mt-tab-item id="2">当地玩乐</mt-tab-item>
  <mt-tab-item id="3">邮轮游</mt-tab-item>
  <mt-tab-item id="4">精品小团</mt-tab-item>
  <mt-tab-item id="5">个性定制</mt-tab-item>
</mt-navbar>

<!-- tab-container 面板 -->
<mt-tab-container v-model="selected">
 <mt-tab-container-item id="1" @click="getTid(tid)">
               <div class="hot_sell">
                       <div v-for='(item,i) of list' :key='i' class="every">
                            <!-- <router-link :to="/Detail/+item.href" class="aaa">  -->
                                <div class="hot_pic">
                                  
                                    <router-link :to="/Detail/+item.href" class="aaa">
                                       <img :src="'https://ztyranxiaomo.applinzi.com/'+item.pic">
                                   </router-link>
                                </div>
                                <div class="hot_box">
                                     <router-link :to="/Detail/+item.href" class="aaa">
                                    <p class="hot_title">{{item.title}} </p>
                                    <p class="hot_sco">{{item.subtitle}}分</p>
                                    <div class="hot_info">
                                        <span class="hot_pri">￥{{item.price.toFixed(2)}}</span>
                                        <span class="hot_up">/起</span>
                                        <span class="sell_info">1034人出行</span>
                                    </div>
                                     </router-link>
                                </div>
                            <!-- </router-link> -->
                       </div>
                    </div>
  </mt-tab-container-item>
   <mt-tab-container-item id="2"  @click="getTid(tid)">
  <div class="hot_sell">
                       <div v-for='(item,i) of other' :key='i' class="every">
                            <!-- <router-link :to="/Detail/+item.href" class="aaa">  -->
                                <div class="hot_pic">
                                  
                                    <router-link :to="/Detail/+item.href" class="aaa">
                                       <img :src="'https://ztyranxiaomo.applinzi.com/'+item.pic">
                                   </router-link>
                                </div>
                                <div class="hot_box">
                                     <router-link :to="/Detail/+item.href.slice(5)" class="aaa">
                                    <p class="hot_title">{{item.title}} </p>
                                    <p class="hot_sco">{{item.subtitle}}分</p>
                                    <div class="hot_info">
                                        <span class="hot_pri">￥{{item.price.toFixed(2)}}</span>
                                        <span class="hot_up">/起</span>
                                        <span class="sell_info">1034人出行</span>
                                    </div>
                                     </router-link>
                                </div>
                            <!-- </router-link> -->
                       </div>
                    </div>
  </mt-tab-container-item>
  <mt-tab-container-item id="3" @click="getTid(tid)" >
       <div v-for='(item,i) of other1' :key='i' class="every">
                            <!-- <router-link :to="/Detail/+item.href" class="aaa">  -->
                                <div class="hot_pic">
                                  
                                    <router-link :to="/Detail/+item.href" class="aaa">
                                       <img :src="'https://ztyranxiaomo.applinzi.com/'+item.pic">
                                   </router-link>
                                </div>
                                <div class="hot_box">
                                     <router-link :to="/Detail/+item.href.slice(5)" class="aaa">
                                    <p class="hot_title">{{item.title}} </p>
                                    <p class="hot_sco">{{item.subtitle}}分</p>
                                    <div class="hot_info">
                                        <span class="hot_pri">￥{{item.price.toFixed(2)}}</span>
                                        <span class="hot_up">/起</span>
                                        <span class="sell_info">1034人出行</span>
                                    </div>
                                     </router-link>
                                </div>
                            <!-- </router-link> -->
                       </div>

  </mt-tab-container-item>
   <mt-tab-container-item id="4"  @click="getTid(tid)">
        <div v-for='(item,i) of other2' :key='i' class="every">
                            <!-- <router-link :to="/Detail/+item.href" class="aaa">  -->
                                <div class="hot_pic">
                                  
                                    <router-link :to="/Detail/+item.href" class="aaa">
                                       <img :src="'https://ztyranxiaomo.applinzi.com/'+item.pic">
                                   </router-link>
                                </div>
                                <div class="hot_box">
                                     <router-link :to="/Detail/+item.href.slice(5)" class="aaa">
                                    <p class="hot_title">{{item.title}} </p>
                                    <p class="hot_sco">{{item.subtitle}}分</p>
                                    <div class="hot_info">
                                        <span class="hot_pri">￥{{item.price.toFixed(2)}}</span>
                                        <span class="hot_up">/起</span>
                                        <span class="sell_info">1034人出行</span>
                                    </div>
                                     </router-link>
                                </div>
                            <!-- </router-link> -->
                       </div>

  </mt-tab-container-item>
   <mt-tab-container-item id="5"  @click="getTid(tid)">
        <div v-for='(item,i) of other3' :key='i' class="every">
                            <!-- <router-link :to="/Detail/+item.href" class="aaa">  -->
                                <div class="hot_pic">
                                  
                                    <router-link :to="/Detail/+item.href" class="aaa">
                                       <img :src="'https://ztyranxiaomo.applinzi.com/'+item.pic">
                                   </router-link>
                                </div>
                                <div class="hot_box">
                                     <router-link :to="/Detail/+item.href.slice(5)" class="aaa">
                                    <p class="hot_title">{{item.title}} </p>
                                    <p class="hot_sco">{{item.subtitle}}分</p>
                                    <div class="hot_info">
                                        <span class="hot_pri">￥{{item.price.toFixed(2)}}</span>
                                        <span class="hot_up">/起</span>
                                        <span class="sell_info">1034人出行</span>
                                    </div>
                                     </router-link>
                                </div>
                            <!-- </router-link> -->
                       </div>

  </mt-tab-container-item>
</mt-tab-container>

    </div>
</template>
<script>
export default {
    data(){
        return{
            value:'',
            selected:'1',
            list:[],  //商品列表数组
            pno:0 ,    //页码（第几页）
            // show:false
            other:[],
            other1:[],
            other2:[],
            other3:[]
        }
    },
      props:["tid"], //{ ..., props:true}
      // 页面加载中调用ajax请求
    created() {
        this.loadMore();
        // this.show=true;
        this.selected=this.tid;
   
        
    },
    methods:{
       getTid(tid){
          var selected;
				this.selected=this.$route.params.tid;
				return selected;
				console.log(selected);
       },
            loadMore(){     // 加载更多
            // 1.创建url
            var url="product";
            // 2.创建obj参数
            this.pno++;
            var obj={pno:this.pno};
            // 3.发送axios请求
            this.axios.get(url,{params:obj}).then(res=>{
            // res中有响应结果码 还有data code；1 data返回结果集 四个商品[{},{},]
            console.log('这是ajax返回的res');
            console.log(res);
            // 4.接收返回结果并且显示
            // this.list = res.data.data;
            // 拼接上一页和下一页的数组  concat
            var rows=this.list.concat(res.data.data);
            this.list=rows;  
                   this.other=this.list.slice(2,6)
                   this.other1=this.list.slice(3,6)
                   this.other2=this.list.slice(4,6)
                   this.other3=this.list.slice(5,6)
            console.log('这是this.list')
            console.log(this.list)
          
            }) 
        },


      cli(i){
       console.log(i)
      }
      // search(e){
      // // var id=event.target.dataset.id;
      // // console.log(id)  
      // //  del(e){
      //               //只有a元素才能触发事件
      //               //DOM操作 
      //               if(e.target.nodeName=='A'){
      //                   //获得当前a元素上绑定的自定义扩展属性的i的值----当前li的下标
      //                   var i=e.target.dataset.i;
			// 									console.log(i);
      //                   //删除i 当前位置， 1 删除一个
      //                   this.tasks.splice(i,1);
      //                   //添加的元素
      //                   // this.tasks.splice(i,1,'添加的元素');
      //               }   
      //  }
    }
}
</script>
<style scoped>

.mint-navbar {
  width:100%;
/* background: #ccc; */
position: fixed;
top: 7%;

}
.mint-search{
width:100%;
position: fixed;
top: 0;
}
.mint-tab-container{
/* display: flex; */
/* justify-content: space-around; */
/* background: #f00; */
margin-top: 18%;

}

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
</style>


