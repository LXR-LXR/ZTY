<template>
    <div class="page-tabbar">
        <!-- 父组件 -->
        <!-- 调用子组件 -->
        <!-- 面板 -->
    <mt-tab-container v-model="active">
        <!-- 首页 -->
        <mt-tab-container-item id="tab1">
            <index :uid='uid'></index>  <!-- 父组件传参给子组件 -->
        </mt-tab-container-item>
        <!-- 目的地 -->
         <mt-tab-container-item id="tab2">
            <goal @paramsChange="getSubComponentParams($event)"></goal>
        </mt-tab-container-item>
        <!-- 行程 -->
         <mt-tab-container-item id="tab3">
            <travel></travel>
        </mt-tab-container-item>
        <!-- 我的 -->
         <mt-tab-container-item id="tab4">
            <my :uid='uid'></my>
        </mt-tab-container-item>
    </mt-tab-container>

        <!-- tabbar 底部导航 -->
        <mt-tabbar  v-model="active" fixed>
            <!-- 首页 -->
            <mt-tab-item id="tab1" @click.native="change(0)">
                <tabbar
                    :normalImage="require('../../../static/home/home.png')"
                    :selectedImage="require('../../../static/home/home-c.png')"
                    :focused="currentIndex[0].isSelect">
                </tabbar>
                首页
            </mt-tab-item>
            <!-- 目的地 -->
             <mt-tab-item id="tab2" @click.native="change(1)">
                 <tabbar
                    :normalImage="require('../../../static/home/goal.png')"
                    :selectedImage="require('../../../static/home/goal-c.png')"
                    :focused="currentIndex[1].isSelect">
                </tabbar>
                {{city}}
            </mt-tab-item>
            <!-- 行程 -->
            <mt-tab-item id="tab3" @click.native="change(2)">
                <tabbar
                    :normalImage="require('../../../static/home/xingcheng.png')"
                    :selectedImage="require('../../../static/home/xingcheng-c.png')"
                    :focused="currentIndex[2].isSelect">
                </tabbar>
                行程
            </mt-tab-item>
            <!-- 我的 -->
             <mt-tab-item id="tab4" @click.native="change(3)">
                 <tabbar
                    :normalImage="require('../../../static/home/me.png')"
                    :selectedImage="require('../../../static/home/me-c.png')"
                    :focused="currentIndex[3].isSelect">
                </tabbar>
                我的
            </mt-tab-item>
        </mt-tabbar>

        <!-- 引入tabbar子组件 -->
        
    </div>    
</template>
<script>
    //引入Tabbar子组件
    import Tabbar from "./common/Tabbar.vue"
    // 引入首页 
    import Index from "./Index.vue"
    // 引入目的地页面
    import Goal from "./Goal.vue"
    // 引入行程页
    import Travel from "./Travel.vue"
    // 引入我的页面
    import My from "./My.vue"
export default {
    data: function() {
        return {
            // 默认显示面板
            active:"tab1",
            currentIndex:[
                {isSelect:true},
                {isSelect:false},
                {isSelect:false},
                {isSelect:false}
            ],
            city:'目的地'
        }
    },
    props:["uid","uid1"],
    created(){
        if(this.uid1!=null)
        this.active=this.uid1;
    },
    methods: {
        change(n){
            for(var i=0;i<this.currentIndex.length;i++){
                if(n==i){
                    this.currentIndex[i].isSelect=true;
                }else{
                    this.currentIndex[i].isSelect=false;
                }
            }
        },
        getSubComponentParams(event){
            this.city=event
        }
    },
    components:{
        // 注册tabbar
        "tabbar":Tabbar,
        // 注册首页
        "index":Index,
        // 注册目的地页面
        "goal":Goal,
        // 注册行程页
        "travel":Travel,
        // 注册我的 页面
        "my":My
    }
}
</script>
<style scoped>
    /* 底部导航宽度  挡住最下方页面 */
    /* 加一个底部的padding */
    .page-tabbar{
        overflow: hidden;
        padding-bottom:50px;
    }
</style>
