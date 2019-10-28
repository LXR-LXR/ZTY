<template>
    <div>
        <div id="container">
        <div class="header">
        </div>
        <ul class="content">
            <li v-for="(item, index) in messageList" :key="index">
                <img :src="'./img/'+(item.myself?'k.png':'l.png')" :class="'img'+(item.myself?'right':'left')">
                <span :class="'span'+(item.myself?'right':'left')">{{item.message}}</span>
            </li>
            <!-- <li><img src="./img/l.png" class="imgleft"><span class="spanleft">好诗好诗</span></li> -->
        </ul>
        <div class="footer">
            <div id="user_face_icon">
                <img src="../../../static/my_personal/brand.png" alt="">
            </div>
            <input id="text" type="text" v-model.trim="inputValue" @keyup.enter='chat' placeholder="说点什么吧...">
            <span id="btn" @click="chat">发送</span>
        </div>
    </div>
    </div>
</template>
<script>
//  el: '#container'
import {js} from '../../assets/jquery-3.2.1.js'
// import {jq} from "https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"
export default {
        data(){
            return{
                //输入的内容,事先约定好的
            inputValue: '',
            //聊天的数组内容
            messageList: []
            }
        },
        
        methods: {
            //点击回车时候发送信息
            chat() {
                this.messageList.push({
                    message: this.inputValue,
                    //这个是判断当前是否是自己输入的内容,自己的是true,机器人的是false
                    myself: true,
                })
                },
                // console.log(message)
                // console.log(1);
                // console.log(this.inputValue);
                //每次发送信息之后机器人就要回复,所以添加完之后直接调用机器人的接口

        },
                created(){
                var url = this.HOME + 'http://www.tuling123.com/openapi/api';
                $.ajax({
                    url: 'http://www.tuling123.com/openapi/api',
                    method: 'post',
                    data: {
                        key: '38f61c4bee2842f49d35b87216f7a217',
                        info: this.inputValue
                    },
                    contentType:'application/json',
                    success: (data) => {
                         console.log(data);
                        this.messageList.push({
                            message: data.text,
                            myself: false
                        })
                    }
                })
                .then(res=>{
                    console.log(res)
                })
                .catch(err=>{
                    console.log(err)
                })
           }  
    
}
</script>
<style scoped>
     /**重置标签默认样式*/
        * {
            margin: 0;
            padding: 0;
            list-style: none;
            font-family: '微软雅黑'
        }
        #container {
            width: 100%;
            height: 100%;
            background: #eee;
            margin: 80px auto 43px;
            position: relative;
            box-shadow: 20px 20px 55px #777;
        }
        .header {
            background: #000;
            height: 40px;
            color: #fff;
            line-height: 34px;
            font-size: 20px;
            padding: 0 10px;
            margin-top:-82px;
            display: flex;
        }
        .footer {
            width: 430px;
            height: 50px;
            background: #666;
            position: absolute;
            bottom: 0;
            padding: 10px;
            margin-bottom:-45px;
            display: flex;
        }
        .footer input {
            width: 275px;
            height: 45px;
            outline: none;
            font-size: 20px;
            text-indent: 10px;
            position: absolute;
            border-radius: 6px;
            right: 80px;
        }
        .footer span {
            display: inline-block;
            width: 62px;
            height: 48px;
            background: #ccc;
            font-weight: 900;
            line-height: 45px;
            cursor: pointer;
            text-align: center;
            position: absolute;
            right: 10px;
            border-radius: 6px;
        }
        .footer span:hover {
            color: #fff;
            background: #999;
        }
        #user_face_icon {
            display: inline-block;
            background: red;
            width: 60px;
            height: 60px;
            border-radius: 30px;
            position: absolute;
            bottom: 6px;
            left: 14px;
            cursor: pointer;
            overflow: hidden;
        }
        img {
            width: 60px;
            height: 60px;
        }
        .content {
            font-size: 20px;
            width: 435px;
            height: 662px;
            overflow: auto;
            padding: 5px;
        }
        .content li {
            margin-top: 10px;
            padding-left: 10px;
            width: 350px;
            display: block;
            clear: both;
            overflow: hidden;
        }
        .content li img {
            float: left;
        }
        .content li span{
            background: #7cfc00;
            padding: 10px;
            border-radius: 10px;
            float: left;
            margin: 6px 10px 0 10px;
            max-width: 310px;
            border: 1px solid #ccc;
            box-shadow: 0 0 3px #ccc;
        }
        .content li img.imgleft { 
            float: left; 
        }
        .content li img.imgright { 
            float: right; 
        }
        .content li span.spanleft { 
            float: left;
            background: #fff;
        }
        .content li span.spanright { 
            float: right;
            background: #7cfc00;
        }
</style>


