<template>
    <div>
        <div id="parent">
            <ul id="pay">
                <li>
                    <router-link :to="/Order/+lid+'/'+uid" >
                        <img src="../../../static/pay_img/fanhui.png"  alt="">
                    </router-link>
                </li>
                <li>
                    收银台
                </li>
                <li>
                    <router-link to="">
                        订单中心
                    </router-link>
                </li>
            </ul>
        </div>
        <div id="parent1"></div>
        <div id="parent2">
            <p id="price">{{price1}}</p>
            <p class="pay2">
                <span>支付</span>
            </p>
            <ul class="price">
                <li>分期方式</li>
                <li>应还总额{{price1}}</li>
            </ul>
        </div>
        <div id="starges">
            <div class="starges">
                <a href="javascript:;" v-for="(item,i) of price" :key="i">
                    <p>￥{{item.price}}x{{item.num}}期</p>
                    <p>含服务费 ￥0.35/期$&nbsp;费率&nbsp;1%/月</p>
                </a>
            </div>
            <mt-radio
                v-model="value"
                align="right"
                :options="['中国工商银行', '中国建设银行', '中国农业银行','中国银行','交通银行']">
            </mt-radio>
            <mt-radio
                v-model="value"
                align="right"
                :options="['微信支付', '支付宝支付']">
            </mt-radio>
        </div>
        <div id="footer">
            <router-link to="" @click.native="showmessage">
                支付 ￥{{price1}}
            </router-link>
            <van-popup
                v-model="show"
                closeable
                close-icon="close"
                bind:close="hidemessage"
                position="bottom"
                :style="{ height: '30%' }"
            >
                <van-cell id="cell1" value="确认付款"/>
                <van-cell id="cell2" :value="'￥'+price1"/>

                <van-button type="primary" size="large" id="button" @click="showmessage1">马上支付</van-button>
                <!-- <router-link to="" @click.native="showmessage1">
                大号按钮
                </router-link> -->
                <van-popup
                    v-model="show1"
                    closeable
                    close-icon="close"
                    bind:close="hidemessage1"
                    position="bottom"
                    :style="{ height: '60%' }"
                >
                    <!-- 密码输入框 -->
                    <van-password-input
                        :value="value1"
                        info="密码为 6 位数字"
                        :focused="showKeyboard"
                        @focus="showKeyboard = true"
                        id="password"
                    />

                    <!-- 数字键盘 -->
                    <van-number-keyboard
                        :show="showKeyboard"
                        @input="onInput"
                        theme="custom"
                        close-button-text="完成"
                        @delete="onDelete"
                        @blur="showKeyboard = false"
                        @close="pay"
                    />
                    
                </van-popup>
            </van-popup>
        </div>
    </div>
</template>
<script>
import SuccessfulVue from './Successful.vue';
    export default {
        data(){
            return {
                price:[
                    {price:11.98,num:3},
                    {price:6.17,num:6},
                    {price:3.26,num:12},
                    {price:1.80,num:24}
                ],
                price1:0,
                value:"",
                show:false,
                show1:false,
                value1: '',
                showKeyboard: true
            }
        },
        props:["lid","uid"],
        created(){
            var uid=this.uid;
            var url='findcart'
            this.axios.get(url,{params:uid})
            .then(res=>{
                this.price1=res.data.data[0].price
            })
        },
        methods:{
            button(){

            },
            showmessage(){
                this.show=!this.show;
            },
            hidemessage(){
                this.show=!this.show;
            },
            showmessage1(){
                this.show1=!this.show1;
            },
            hidemessage1(){
                this.show1=!this.show1;
                this.show=!this.show;
            },
            onInput(key) {
                this.value1 = (this.value1 + key).slice(0, 6);
            },
            onDelete() {
                this.value1 = this.value1.slice(0, this.value1.length - 1);
            },
            pay(){
                var arr=this.value1.split("");
                if(arr.length===6)
                {
                    this.$toast('支付成功');
                    var obj={status:2}
                    this.axios.get('/updateOrder',{params:obj})
                    .then(result=>{})
                    this.$router.push('/Successful/'+this.uid);
                    this.show=!this.show;
                }
            }
        }
    }
</script>
<style scoped>
    #parent{
        position: fixed;
        width:100%;
        z-index:2;
    }
    #pay{
        width:100%;
        background-color:red;
        opacity: 0.8;
        display: flex;
        position: fixed;
        justify-content: space-between;
        padding:10px 0;
        
    }
    #pay li{
        width:20%;
        color:#fff;
        font-size:17px;
        margin-right: 15px;
    }
    #pay li:nth-child(2){
        margin-left:25px;
    }
    #pay li img{
        width:25px;
    }
    #parent1{
        width:100%;
        height:51.4px;
        opacity: 0.5;
    }
    #parent2{
        width:100%;
    }
    #price{
        width:100%;
        text-align: center;
        font-size: 20px;
        color:red;
    }
    .pay2{
        width:100%;
        background:lightpink;
        font-size: 18px;
    }
    .pay2 span{
        color:red;
        display: block;
        margin:10px 15px;
    }
    .price{
        display: flex;
        justify-content: space-between;
        width:100%;
    }
    .price li{
        width:30%;
        font-size: 13px;
        padding:10px;
    }
    .price li:nth-child(2){
        text-align: right;
    }
    #starges{
        width:100%;
    }
    .starges{
        padding:10px;
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
    }
    .starges a{
        width:48%;
        background:lightgray;
        display: block;
        padding:10px 0;
        border-radius: 5px;
    }
    .starges a:nth-child(1),.starges a:nth-child(2){
        margin-bottom:10px;
    }
    .starges a:focus{
        color:red;
    }
    .starges a p{
        text-align: center;
        color:#000;
        font-size:12px
    }
    .starges a p:nth-child(1){
        font-size: 15px;
    }
    #footer{
        padding-top:5px;
        width:100%;
        position: fixed;
        bottom:0;
        background:#fff;
    }
    #footer a{
        background: red;
        color:#fff;
        width:90%;
        border-radius: 15px;
        display: block;
        margin: 5px auto;
        text-align: center;
        padding:10px 0;
        
    }
    #button{
        margin-top:3.5%; 
        background: red;
    }
    .van-cell__value--alone{
        text-align: center;
        
        
    }
    #cell1{
        font-size: 20px;
    }
    #cell2 {
        font-size: 30px;
        margin-top:50px;
    }
    #password{
        margin-top:50px;
    }
</style>
