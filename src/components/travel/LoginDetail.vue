<template>
<div class="container">
    <!-- 顶部导航 -->
    <div class="header">
        <img src="../../../static/my_login/jiantou.png" alt="">
        <h4>用户信息</h4>
        <button>保存</button>
    </div>
    <!-- 头像和昵称 -->
    <div class="head">
         <div class="common">
            <h5>头像</h5>
            <div class="user-header">
                <input type="file" name="image" accept="image/*" @change='onchangeImgFun' class="header-upload-btn user-header-com">
                <img  alt="" :src='imgStr' class=" user-header-com">
                <p class="tip"><span class="error">{{errorStr}}</span></p>
            </div>
        </div> 
        <div class="common">
            <h5>昵称</h5><input type="text" v-model="nchen">
        </div>
    </div>  
    <!-- 中间分割线 -->
    <div style="border:4px solid #cccccc;" ></div>
    <!-- 中间姓名部分 -->
    <div class="middle">
        <div class="common">
            <h5>姓名</h5><input v-model="mname" type="text">
        </div>
        <!-- 性别 -->
        <div class="common">
            <h5>性别</h5>
            <input type="radio" name="sex" id="1" checked>
            <label for="1" style="padding-top:23px;padding-right:20px">男</label>
			<input type="radio" name="sex" id="2">
            <label for="2" style="padding-top:23px;">女</label>
        </div>
        <!-- 出生日期 -->
        <div class="common">
            <van-field label="出生日期" v-model="timeValue" placeholder="  请选择日期" readonly @click="showPopFn()"/>
            <van-popup v-model="show" position="bottom" :style="{ height: '40%' }">
                <van-datetime-picker v-model="currentDate" type="date" @change="changeFn()" @confirm="confirmFn()" @cancel="cancelFn()" />
            </van-popup>
        </div>
        <!-- 中间分割线 -->
        <div style="border:4px solid #cccccc;" ></div>
    <!-- 手机号 -->
        <div class="pe">
            <div class="common">
                <h5>手机号码</h5><input v-model="phone" type="text">
                <span>修改手机号</span>
            </div>
        </div>
        <!-- 邮箱 -->
        <div class="pe">
            <div class="common">
                <h5 style="margin-left:3rem;">邮箱</h5><input v-model="email" type="text">
                <span>修改邮箱号</span>
            </div>
        </div>
        <div class="bt">
            <button>退出登录</button>
        </div>
    </div>
</div>    
</template>
<script>
    export default{
        data(){
            return{
                // 头像
                imgStr: require('../../../static/my_login/qq.png'),
                errorStr: '',
                // 昵称
                nchen:"臭泽泽",
                // 姓名
                mname:"崔尚泽",
                // 选择日期
                currentDate: new Date(),
                changeDate: new Date(),
                show: false, // 用来显示弹出层
                timeValue: '',
                // 手机号
                phone:"86"+"+"+"13552039585",
                // 邮箱号
                email:"3838438@qq.com"
            }
        },
        methods:{
            // 头像上传
            onchangeImgFun (e) {
                var file = e.target.files[0]
            // 获取图片的大小，做大小限制有用
                let imgSize = file.size
                var _this = this // this指向问题，所以在外面先定义
                // 比如上传头像限制5M大小，这里获取的大小单位是b
                if (imgSize <= 50 * 1024) {
                    // 合格
                    _this.errorStr = ''
                    // base64方法 
                    var reader = new FileReader()
                    reader.readAsDataURL(file) // 读出 base64
                    reader.onloadend = function () {
                        // 图片的 base64 格式, 可以直接当成 img 的 src 属性值
                        var dataURL = reader.result
                        _this.imgStr = dataURL
                        // 下面逻辑处理
                    }
                } else {
                        _this.errorStr = '图片大小超出范围'
                    }
            },
            // 选择日期
            showPopFn() {
                this.show = true;
            },
            showPopup() {
                this.show = true;
            },
            changeFn() { // 值变化是触发
                this.changeDate = this.currentDate // Tue Sep 08 2020 00:00:00 GMT+0800 (中国标准时间)
            },
            confirmFn() { // 确定按钮
                this.timeValue = this.timeFormat(this.currentDate);
                this.show = false;
            },
            cancelFn(){
                this.show = true;
            },
            timeFormat(time) { // 时间格式化 2019-09-08
                let year = time.getFullYear();
                let month = time.getMonth() + 1;
                let day = time.getDate();
                return year + '年' + month + '月' + day + '日'
            },
            mounted() {
                this.timeFormat(new Date());
            },
        }
    }
</script>
<style scoped>
/*导航条*/
.contanier{
    /* text-align: center; */
    margin: 20% auto;
}
.header{
    text-align: left;
    display: flex;
    margin-top:5%;
    justify-content: center;
    margin-bottom:0.5rem;
}
.header>h4:nth-child(2){
    margin-top:0;
    margin:auto;
}
.header>button{
    width:40px;
    height:24px;
    font-size:12px;
    padding:0;
    border:0;
    border-radius:20px;
    box-sizing:border-box;
    margin-right:8px;
}
/* 箭头图片 */
.header>img{
    width:18px;
    height:18px;
    margin-top: 0%;
    margin-left:8px;;
} 
/*头部样式*/
.common{
    display: flex;
    line-height: 1.8;
    border-bottom: 1px solid #cccccc;
    box-sizing: border-box;
}
h5{
    margin-left:3rem;
    font-size:16px;
    font-weight:lighter;
}
/* 上传头像 */
.user-header{
    position: relative;
    display: inline-block;
}
.user-header-com{
    width: 25px;
    height: 25px;
    display: inline-block;
    margin-top: 1rem;
}
.header-upload-btn{
    position: absolute;
    left: 0;
    top: 0;
    opacity: 0;
  /* 通过定位把input放在img标签上面，通过不透明度隐藏 */
}
.tip{
  font-size: 14px;
  color: #666;
  display: inline-block;
}
/* error是用于错误提示 */
.error{
  font-size: 12px;
  color: tomato;
  margin-left: 10px;
}
/*输入框样式*/ 
input{
    border:0px;
    margin:0;
    height:1.5rem;
    margin-top:15px;
    margin-bottom: 15px;
    outline:none;
}
::-webkit-input-placeholder {
    color: #b1afae;
    font-size: 16px;
    font-weight:normal;
}
/*中间样式*/
.common>h5{
    margin-right:1.5rem;
    line-height: 0.3px;
} 
/* 选择日期 */
.van-cell {
    color:#2c3e50;
    font-size:16px;
    font-weight: lighter;
    padding-left:3px;
}
/* 手机号 */
.pe{
    box-sizing: border-box;
    display:flex;
    border-bottom:1px solid #cccccc;
}
.pe>.common{
    border:0;
}
.pe>.common>input{
    width:150px;
}
.pe>.common>h5{
    margin-left:1rem;
}
.pe>.common>span{
    line-height: 3.5rem;
    margin:0;
    margin-left:2rem;
}
/* 退出登录按钮 */
.bt>button{
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
    margin-top:4rem;
}
</style>
