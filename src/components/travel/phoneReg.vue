<template>
    <div>
        <h3> 用户手机注册组件</h3>
       <div class="container">
        <div id="phone">  
            <input 
                 v-model="phone"
                placeholder='手机号'
                type="text" 
                id="phone-inp"
                class='input-same'
                v-focus
                >
                <br>
                <span class='phone-msg'>{{phoneMsg}}</span>
            </div> 
            <!-- phone结尾 -->
            <!-- 短信验证码s输入框 -->
            <div id="text-code">
                <input 
                v-model="testCode"
                id='input-code'
                type="text" 
                placeholder='短信验证码'
                >
                <button
                    :disabled='disabled'
                    id='send-msg'
                     @click='sendTextCode'
                >
                {{content}}
                </button>
            </div>
            <!-- 输入密码 -->
            <input
                 v-model='upwd'
                class='input-same'
                 type="password"
                placeholder='密码(6-20位数字+ 字母组合)'
                 >
            <!-- 确认密码 -->
            <input 
                class='input-same'
                v-model="repeatUpwd"
                id='cupwd' type="text"
                placeholder='确认密码'    
            >
            <div ></div>
            <br>
            <!-- <div>
            <input type="radio">    我已阅读
            </div> -->
            <button id='reg-btn' @click="sendReg">注册</button>
        </div>  <!-- container 结尾 -->
          
    </div>
</template>
<script>
//1.手机非空/格式验证函数
// 2，生成验证码 并保存到session
// 3 发短信按钮动态变化 发送axiox 
// 4
export default {
      data(){
        return {
            phone:'',
            testCode:'',
            phoneMsg:'',
            upwd:'',
            cupwd:'',
            repeatUpwd:'',
            // list:[],
            content:'发送',
            // 验证码
            ccode:'',
            // 验证开关
            switchOn:false,
            // 发送验证码按钮状态
            disabled:false,
            totalTime:3
        }
    },
    methods:{
          //1.手机验证函数
        //    在点击发送验证码 后在调用
            regPhone(){
                // 独立函数 依赖 变量  phone   phoneMsg
                // 1:定义手机验证正则
                  var reg=/^0?(13[0-9]|15[012356789]|18[0236789]|14[57])[0-9]{8}$/
                // 如果手机号为空
                if(this.phone==''){
                    this.phoneMsg='手机号不能为空'
                    this.switchOn=false
                }else if(!reg.test(this.phone)){
                    this.phoneMsg='手机号格式不对'
                    this.switchOn=false
                }else{
                    // 手机号验证通过
                    this.phoneMsg=''
                    this.switchOn=true 
                }
            },

            // 验证密码
            regUpwd(){
                  var reg=/^[a-zA-Z0-9_-]{3,16}$/
                // 如果为空
                if(this.upwd===''){
                    this.upwdMsg='密码不能为空'
                    return
                }else if(!reg.test(this.upwd)){
                    this.upwdMsg='以字母开头，长度在6-18之间，只能包含字母、数字和下划线。'
                }else{
                    return true
                }
            },
                // 2:生成随机验证码模块
      generateCode(){
            const random =[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E',
             'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
        'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
        let code=''
        for(let i= 0; i<4;i++){
            // let index= Math.floor(Math.random()* 36)
            let index= Math.floor(Math.random()*10 )
            code+=random[index]
        }
             this.ccode=code
        // 将生成的验证码存入session
        sessionStorage.setItem('key',this.ccode)
        },
// 3 发短信按钮动态变化 发送axiox 
        sendTextCode(){
            // 首先验证手机格式
            this.regPhone()
            //  this.regPhone()
        if(this.switchOn){
         // 如果倒计时事件在 0-60 之间
            if(this.totalTime>0){
                var timer= setInterval(()=>{
                    // this.totalTime=60
                    this.totalTime--;
                    this.content=(this.totalTime)+'S重新发送'
                    this.disabled=true
                    if(this.totalTime===0){ 
                         this.disabled=false
                         this.content='重新发送'
                        clearInterval(timer)
                        }
                },1000)
            }
            // 调用验证码生成器
            this.generateCode()
                // 第一次ajax 请求验证手机号
            this.axios.get('http://127.0.0.1:4000/registe',{
                params:{
                    // 把手机号和验证码 发给后台
                    phone:this.phone,
                    ccode:this.ccode,
                    // upwd:this.upwd
                }
            })
            .then(res=>{
                // 如果手机号已注册  就提示
                if(res.data.code==1){
                    this.phoneMsg='该手机号已注册'
                    this.switchOn=false
                }
            })
            .catch(err=>console.log(err))

        } //if 结尾
        },
        // 注册功能函数
        // 功能：如果手机号和密码符合要求，就将用户手机号 和 密码发给数据库
        sendReg(){
            if(this.switchOn===true){
                this.axios.post('http://127.0.0.1:4000/register',
                    `phone=${this.phone}&upwd=${this.upwd}`
                )
                      .then(res=>{console.log(res.data)})
                      .catch(err=>{console.log(err)})
                }


        }
    },//methods 结尾
    // 监视函数
    watch:{
        testCode(){
         if(this.testCode.length===4){
            // 如果验证码正确 就显示
            this.testCode===this.ccode && (this.content='验证通过')
            // 如果不正确 就显示
            this.testCode !== this.ccode && (this.content='验证码不正确')
            }
        },
        // testCode(){
        //     if(this.se)
        // },
        // 检测确认密码 和密码是否一致
        repeatUpwd(){
          this.repeatUpwd===this.upwd?(this.switchOn=true):(this.switchOn=false) 
          console.log(this.switchOn)
        }
    }
}
</script>

<style>
    .container{
        text-align:center;
    }
    .input-same{
        width:70%;
        height:40px;
        line-height:40px;
        border:1px solid transparent;
        border-bottom:1px solid #aaa;
        padding-left:4%;
        margin-top: 12px;
         outline:0; 
        border-radius: 5px;
        box-shadow:1px 2px 5px #edd;
    }
    .phone-msg{
        color:red;
    }
    #text-code{
        text-align:center;
        margin:0 auto;
        border-radius:5px;
        width:74%; 
        height:40px;
        display: flex;
          border:1px solid transparent;
        border-bottom:1px solid #aaa;
        margin-top: 15px;
        box-shadow:1px 2px 5px #edd;

    }
      #input-code{
        outline:0; 
        width:70%;
        border-radius:10px;
         padding-left:4%;
        line-height: 40px;
          
    }
     #text-code>#send-msg{
         outline: none;
         font-size: 14px;
        border-radius: 5px;
        width:30%;
        line-height: 40px;
    background: #fff;

    }
#cupwd{
    margin-top: 3px;
}
#reg-btn{
    width: 74%;
    height: 45px;
    border-radius:10px;
    background: rgb(60, 146, 226);
    color:aliceblue;
    font-size: 20px;
}
</style>   