<template>
  <div>
    <!-- 顶部导航 -->
    <div>
      <mt-header title="提交订单">
        <!--此处跳转到详情页-->
        <router-link :to="/Detail/+lid+'/'+uid" slot="left">
        <mt-button icon="back">back</mt-button>
        </router-link>
      </mt-header>
    </div>
    <!-- title -->
    <div id="orderContent">
    <div id="orderTitle">
      <h3>{{title}}</h3>
    </div>
    <!-- 出行时间 -->
    <div id="orderTripeTime">
        <div @click="selectData">
          选择出行时间：{{this.selectedValue}}
        </div>
        <!-- @touchmove.prevent 阻止默认事件，此方法可以在选择时间时阻止页面也跟着滚动。 -->
        <div @touchmove.prevent>
            <!-- 年月日时分选择 -->
            <mt-datetime-picker
                lockScroll="true"
                ref="datePicker"
                v-model="dateVal"
                class="myPicker"
                type="date"
                year-format="{value}年"
                month-format="{value}月"
                date-format="{value}日"
                @confirm="dateConfirm()">
            </mt-datetime-picker>
        </div>
    </div>
     <!-- 票价类型 -->
     <div class="ticketType">
        <div class="ticketTypeLt">
          <p>成人<span>￥{{adultPrice}}/人</span></p>
        </div>
        <div class="ticketTypeRt">
        <van-stepper class="ticketBtn" v-model="adult" />
        </div>
    </div>
     <div class="ticketType">
        <div class="ticketTypeLt">
          <p>儿童<span>￥{{childrenPrice}}/人</span></p><!-- toFixed()存在缺陷有空修改 -->
        </div>
        <div class="ticketTypeRt">
        <van-stepper v-model="child" />
        </div>
    </div>
     <div class="ticketType">
        <div class="ticketTypeLt">
          <p>组团<span>￥{{organizePrice}}/人</span></p>
        </div>
        <div class="ticketTypeRt">
        <van-stepper v-model="group" />
        </div>
    </div>
   
    </div> <!-- 游玩者信息 -->
    <div id="orderNews">
      <mt-field label="联系人" placeholder="输入游客信息" v-model="uname"></mt-field>
      <mt-field label="手机号码" placeholder="输入手机号用于接收短信" type="tel" v-model="phone"></mt-field>
      <mt-field label="接送地址" placeholder="输入地址用于酒店接送" type="tel" v-model="address"></mt-field>
    </div>
    <!-- 底部结算 -->
    <div id="orderSub">
      <ul>
        <li>总价:￥<span>{{adult*adultPrice+child*childrenPrice*0.5+group*organizePrice*0.85.toFixed(2)}}</span></li>
        <li><router-link to="" id="orderSubBtn" @click.native="user">提交订单</router-link></li><!--跳转支付-->
      </ul>
    </div>
  </div>
</template>
<script>
  import {formatDate} from '../../assets/formatdate.js'
  export default {
    name: 'pickerDemo',
    data(){
      return{
        dateVal: '', // 默认是当前日期
        selectedValue: '',
        adult:0,
        child:0,
        group:5,
        uname:"",
        phone:"",
        address:"",
        title:"",
        year:"",
        dateValue:"",
        popupVisible:false,
        disabled:false,
        isClicked:false,
        adultPrice:0,
        childrenPrice:0,
        organizePrice:0
      }
    },
    props:["lid","uid"],
    created(){
        let that = this
        this.pricE();
    },

    methods:{
        user(){
          //提交订单将信息插入数据库
          //var uid
          var url='addcart';
          var lid=this.lid;
          var adult=this.adult;
          var children=this.child;
          var organize=this.group;
          var uname=this.uname;
          var phone=this.phone;
          var address=this.address;
          var price=this.adult*this.adultPrice+this.child*this.childrenPrice*0.5+this.group*this.organizePrice*0.85.toFixed(2);
          var obj={
            lid:lid,
            adult:adult,
            children:children,  
            organize:organize,
            uname:uname,
            phone:phone,
            address:address,
            price:price
          }
          this.axios.get(url,{params:obj}).then(res=>{
            if(res.data.code===1)
            {
              
              this.$router.push('/Pay/'+this.lid+'/'+this.uid);
            }
          })
        },
        selectData () { // 打开时间选择器
            // 如果已经选过日期，则再次打开时间选择器时，日期回显（不需要回显的话可以去掉 这个判断）
            if (this.selectedValue) {
                this.dateVal = this.selectedValue
            } else {
                this.dateVal = new Date()
            }
            this.$refs['datePicker'].open()
        },
        dateConfirm () { // 时间选择器确定按钮，并把时间转换成我们需要的时间格式
            this.selectedValue = formatDate(this.dateVal)
        },
          loadMore(){
              //    url 接口 addcart添加购物车
    // 参数
 //1 创建url 请求服务器的地址
         var url='findcart';
        // 2发送ajax 请求获取购物车
        this.axios.get(url).then(res=>{
            if(res.data.code==-1){
                // 提示交互提示框 .then 回调函数 函数执行完后进行的操作
                this.$messagebox('消息','请登录').then(res=>{
                    // 跳转到登录的组件
                    this.$router.push('/Login');

                })
            }else{
                 // 3将服务器返回数据保存list
                    //this.list=res.data.data
                 // (1)为每个商品添加状态******** 循坏遍历
                 // res变量data属性data数组 
                var list=res.data.data;
                //  for(var item of list){
                //      item.cb=true;

                //  }
                //  (2)添加属性并且赋值
                this.list=list;
                // 2.9加载完之前 前清空
                // this.$store.commit('clearCart');
                // (3)创建循环 遍历数组
                // for(var item of this.list){
                //     // (4)修改购物车数量
                //     this.$store.commit('addCart')

                // }
            }
        })
        },
        pricE(){
          //获取三种价格
          var url='detail'
          var obj={lid:this.lid}
          this.axios.get(url,{params:obj})
          .then(res=>{
            console.log(res)
            this.adultPrice=res.data.data[0].adult
            this.childrenPrice=res.data.data[0].children
            this.organizePrice=res.data.data[0].organize
            this.title=res.data.data[0].details
          })
        },
    },
    

    };
</script>
<style>
/*顶部导航样式*/
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
  /*orderContent*/
 #orderContent{
    width:90%;
    padding-left:20px;
  }
  /*title*/
  #orderTitle{
    width:90%;
    text-align: left;
  }
  #orderTripeTime{
  border-top:1px solid rgb(235,234,234);
  width:100%;
  text-align:left;
  height:40px;
  line-height:40px;
  }
 /*票价类型*/
  .ticketType{
    display:flex;
    width:100%;
    height:60px;
    border-top:1px solid rgb(235,234,234);
    justify-content:space-between;
  }
   .ticketTypeLt{
    line-height:60px;
  }
  .ticketTypeLt>p{
    color: rgb(42,41,41);
  }
  .ticketTypeLt>p>span{
    color:#fd0000;
  }
  .ticketTypeRt{
    margin-top:15px;
  }
  #orderNews{
    border-top:1px solid rgb(235,234,234);
    text-align: left;
    padding-left: 10px;
  }
  #orderSub{
    border-top:1px solid rgb(235,234,234);
    width:100%;
    height:60px;
    position:fixed;
    bottom:0;
    text-align: center;
  }
  #orderSub ul{
    display:flex;
    justify-content:space-between;
  }
  #orderSub ul{
    line-height:60px;
  }
  #orderSub ul li:nth-child(1){
    padding-left:20px;
  }
  #orderSubBtn{
    width:120px;
    height:60px;
    background-color:#fd0000;
    color:#fff;
    display:block;
  }
</style>