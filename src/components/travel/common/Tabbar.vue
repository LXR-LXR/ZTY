<template>
    <!-- Tabbar 子组件 -->
    <div>
       <img :src="focused?selectedImage:normalImage" alt="" class="imgstyle"/>
    </div>
</template>
<script>
export default {
    props:{
        focused:false,  //选中状态
        // 选中显示图片  默认显示图片
        selectedImage:{default:""},//选中
        normalImage:{default:""}//默认
    },
}
</script>
<style>
    .imgstyle{
        width:30px;
        height:30px;
 }
</style>
