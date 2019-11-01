<template>
    <div>
        <div id="parent">
            <van-button type="primary" to="loginMethods">返回</van-button>
            <van-button color="linear-gradient(to right, #4bb0ff, #6149f6)">注册页面</van-button>
        </div>
        <van-cell-group>
            <van-field
                v-model="uname"
                @blur="regUname" 
                required
                clearable
                label="用户名"
                right-icon="question-o"
                placeholder="请输入用户名"
                @click-right-icon="$toast('用户名')"
            />
            <span class="regMsg">{{unameMsg}}</span>
            <van-field
                v-model="upwd"
                @blur="regUpwd"
                type="password"
                label="密码"
                placeholder="请输入密码"
                required
                right-icon="question-o"
                @click-right-icon="$toast('密码')"
            />
            <span class="regMsg">{{upwdMsg}}</span>
            <van-field
                v-model="supwd"
                @blur="confirm"
                type="text"
                label="确认密码"
                placeholder="确认密码"
                required
                right-icon="question-o"
                @click-right-icon="$toast('密码')"
            />
            <span class="regMsg">{{supwdMsg}}</span>
            <van-field
                v-model="phone"
                @blur='regPhone'
                type="text"
                label="手机号"
                placeholder="请输入手机号"
                required
                right-icon="question-o"
                @click-right-icon="$toast('手机号')"
            />
            <span class="regMsg">{{phoneMsg}}</span>
            <van-field
                v-model="email"
                @blur='regEmail'
                type="text"
                label="邮箱号"
                placeholder='请输入邮箱'
                required
                right-icon="question-o"
                @click-right-icon="$toast('邮箱')"
            />
            <span class="regMsg">{{emailMsg}}</span>
            <button @click="submit" id='reg-btn'> 注册</button>
        </van-cell-group>
    </div> 
</template>
<script>
  
    // 密码正则
    // var upwd
     export default {
        data(){
            return {
                uname:'',
                upwd:'',
                supwd:'',
                email:'',
                phone:'',

                unameMsg:'',
                upwdMsg:'',
                supwdMsg:'',
                emailMsg:'',
                phoneMsg:''

            }
        },
        created() {
            
        },
        methods:{
            //   var u=this.uname
            //1:事件函数：用户名焦点消失事件  验证用户名  字母数字 下划线 3-16位 
            regUname(){
                // 创建用户名正则验证 字母数字 下划线 3-16位 
                 var unameReg =/^[a-zA-Z0-9_-]{3,16}$/
                //  console.log(typeof this.uname)
                // 获取用户输入的用户名
                var u=this.uname
                // 非空验证
                if(u===''){
                     this.unameMsg='用户名不能为空'
                   return;
                }else{
                      //如果不合规范 则提示  
                 unameReg.test(u)?this.unameMsg='':this.unameMsg='用户名4-16 包含字母数字'
                }    
            },
            //2 :事件函数： 密码焦点消失 验证密码格式
            regUpwd(){
                // 定义密码验证正则
                //   以字母开头，长度在6-18之间，只能包含字符、数字和下划线。
                  var upwdReg=/^[a-zA-Z0-9_-]{3,16}$/
                // 如果为空
                if(this.upwd===''){
                    this.upwdMsg='密码不能为空'
                    return
                }else{
                 upwdReg.test(this.upwd)?this.upwdMsg='':this.upwdMsg='以字母开头，长度在6-18之间，只能包含字母、数字和下划线。'
                }
            },
            // 3: 密码确认函数   
            confirm(){
                   this.supwd!=this.upwd? this.supwdMsg='两次输入的密码不一致':this.supwdMsg=''
            },
            //4.手机验证函数
            regPhone(){
                  // 定义手机验证正则
                  var phoneReg=/^0?(13[0-9]|15[012356789]|18[0236789]|14[57])[0-9]{8}$/
                // 如果为空
                if(this.phone===''){
                    this.phoneMsg='手机号不能为空'
                    return
                }else{
                 phoneReg.test(this.phone)?this.phoneMsg='':this.phoneMsg='手机号格式不对'
                }
            },
            //5 邮箱正则验证
             regEmail(){
                // 定义邮箱验证正则  /^\w+[-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/
                  var emailReg= /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/
                // 如果为空 就提示
                if(this.email===''){
                    this.emailMsg='邮箱不能为空'
                    return
                }else{
                // 否则用正则验证输入内容
                 emailReg.test(this.email)?this.emailMsg='':this.emailMsg='邮箱格式不对'
                }
            },
            //提交发送axios  get 请求
            submit(){
                 var u=this.uname
                 var url='register';
                 var obj={uname:u,upwd:this.upwd,email:this.email,phone:this.phone}
               this.axios.get(
                   url,
               {params:obj})
               .then(result=>{
                //9:获取服务器返回结果
                //10:登录失败提示消息
                //11:登录成功跳转 /Product
                if(result.data.code==200){
                    this.$messagebox('消息','用户名注册成功，即将跳转登陆页面');
                    this.$router.push('/loginMethods')
                }
                else{
                    this.$messagebox('消息','用户名已存在，请重新输入');
                }  
               })
            }
        }
    }        

</script>
<style scoped>
    #parent{
        width:100%;
        display: flex;
        justify-content: space-between;
    }
    .van-button--normal:nth-child(2)
    {
        width:80%;
    }
    .van-button--primary:nth-child(1){
        width:20%;
    }
    .van-cell:nth-child(1){
        margin-top:60px;
    }
    .van-cell{
        margin-bottom:15px;
    }
    #reg-btn{
        margin-top:15px;
        width:100%;
        border:0;
        background:cyan;
        padding:15px 0
    }
    .regMsg{
        color:red;
    }

</style>