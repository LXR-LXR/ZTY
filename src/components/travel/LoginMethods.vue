<template>
<div>
  <div id="fanhui" >
      <router-link to="/" :uid1="uid1">返回</router-link> 
  </div>
  <div id="parent">
    <!-- logo -->
    
    <h4>憨憨账号登录</h4>
    <div class="input">
        <!--用户名输入框-->
        <input type="text" autofocus placeholder="用户名"  v-model="uname"><br>
        <!--密码输入框-->
        <input type="password" placeholder="密码" v-model="upwd" >
    </div>
    <!--登录按钮-->
    <div class="bt">
        <router-link to="">
            <button type="primary" size="large" @click="login">登录</button>
        </router-link>
    </div>
    <!-- 其他登录方式和注册 -->
    <div class="loginType">
        <!-- 短信登录 -->
        <div class="dx" >
            <span >短信快捷登录</span> 
        </div>
        <!-- 去注册 -->
        <div class="torg" >
            <router-link class="forget" to='/userReg'>还没账号？去注册<img src="../../../static/my_login/jiantou.png" style="width:10px; height:10px" ></router-link>
        </div>
    </div>
    <!-- 微信其他方式登录 -->
    <div style="margin-top:10rem;font-weight:bold;">其他登录方式</div>
    <div class="other">
        <img src="../../../static/my_login/weixin.png" alt="" >
        <img src="../../../static/my_login/weibo.png" alt="" >
        <img src="../../../static/my_login/qq.png" alt="" >
    </div>
    <footer>
        <div class="foot">登录/即代表同意<a href=""> 臭泽泽用户使用协议</a></div>
    </footer>
  </div>
  </div>
</template>
<script>
export default {
  data(){
    return {
      uname:"", //输入用户名
      upwd:"",   //输入密码
      uid1:"tab4"
    }
  },
  methods:{
    login(){
     //功能:完成用户登录操作
     //1:获取用户输入用户名
     var u = this.uname;
     //2:获取用户输入密码
     var p = this.upwd;
     //3:创建正则表达式 3~12 字母数字
     var reg = /^[a-z0-9]{3,12}$/i;
     //4:验证用户名
     if(reg.test(u)==false){
      console.log("2:");
      //5:验证不成功 提示消息
      this.$messagebox("用户名格式不正确");
      return;
     }
     //6:验证密码
     if(reg.test(p)==false){
      //7:验证不成功 提示消息
      this.$messagebox("","密码格式不正确");
      return;
     }
  //8:发送ajax 请求
var url='login';
var obj={uname:u,upwd:p};
     this.axios.get(
    url,
    {params:obj}
).then(res=>{
    console.log(res);
    //9:获取服务器返回结果
     //10:登录失败提示消息
     //11:登录成功跳转 /Product
       console.log(res.data.code);
       if(res.data.code<0){
       this.$messagebox('消息','用户名和密码错误');
       }else{
        //跳转Prodect组件 
        this.$messagebox('登录成功');
        console.log(res.data.data)
        this.$router.push('/home/'+res.data.data);
       }


    })
  }
}
}
</script>
<style scoped>
#parent{
    text-align:center;
    /* display: flex; */
    /* justify-content: center; */
    margin: 20% auto;
}
#fanhui{
    margin:10px 0 0 10px;
    font-size:20px;
}
/*Logo字体*/ 
h4{
    text-align: left;
    font-size: 24px;
    margin-left: 20%;
}
/*输入框样式*/
input{
    outline: 0;
    border:0px;
    border-bottom:0.05rem solid #ddd;
    margin:0;
    height:100%;
    height:2rem;
    width:80%;
    margin-top:10px;
    margin-bottom: 15px;
}
/*登录按钮样式*/
.bt button{
    -webkit-appearance: none;
    -moz-appearance: none;
    border-radius: 20px;
    border: 0;
    box-sizing: border-box;
    color: inherit;
    display: block;
    font-size: 18px;
    height: 41px;
    width:320px;
    color:#fff;
    background-color:#26a2ff;
    display: inline-block;
    padding: 0 12px;
    margin-top:1.4rem;
}
/*短信登录、注册样式*/
.loginType{
    display: flex;
    justify-content: space-between;
    line-height: 3rem;
    font-weight:normal;
    font-size:12px;
} 
.dx{
    padding-left:1.7rem;
}
.torg{
    padding-right:1.5rem;
}
/*其他登录样式*/
.other{
    margin-top:2rem;
} 
.other>img{
    padding:0 1.5rem 0.5rem 1.5rem;
    width:40px;
}
.foot{
        font-size:0.75rem;
        color:#ccc;
        text-align:center;
}
.foot>a{
        color:#ccc;
        text-decoration:underline;
}
</style>
