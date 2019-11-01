<template>
    <div>
        <p>订单提交成功</p>
        <p>{{seconed}}s钟之后将跳转到订单页</p>
    </div>
</template>
<script>
    export default {
        data(){
            return{
                seconed:5
            }
        },
        created(){
            this.tiaozhuan();
        },
        props:["uid"],
        methods:{
            tiaozhuan(){
                setInterval(()=>{
                    this.seconed-=1;
                    if(this.seconed===0){
                        this.$router.push('/MyOrder/order/'+0+'/'+this.uid)
                    }
                },1000)
            }
            
        }
    }
</script>
<style scoped>
    div p{
        color:red;
        font-size: 25px;
    }
</style>