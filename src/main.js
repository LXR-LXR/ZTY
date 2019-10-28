// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
// Vue.config.productionTip = false


// 1.完整引入mint-ui组建库中所有组件
import MintUI from "mint-ui"
// 2.单引入mint-ui库中样式文件
import "mint-ui/lib/style.css"
// 按需引入vant
import { Field } from 'vant';
import 'vant/lib/field/style'
import { Popup } from 'vant';
import 'vant/lib/popup/style'
import { Picker } from 'vant';
import 'vant/lib/index.css';
import 'vant/lib/picker/style'
import { DatetimePicker } from 'vant';
import 'vant/lib/datetime-picker/style'
import { Panel } from 'vant';
import { Button } from 'vant';
import { Cell, CellGroup } from 'vant';
import { PasswordInput, NumberKeyboard } from 'vant';

Vue.use(PasswordInput).use(NumberKeyboard);
import { Toast } from 'vant';

Vue.use(Toast);
// 遮罩层
import { Overlay } from 'vant';
Vue.use(Overlay);
//计步器
import { Stepper } from 'vant';
Vue.use(Stepper);
// npm install --save axios
import axios from 'axios'
// 6 配置服务器基础路径
axios.defaults.baseURL='https://ztyranxiaomo.applinzi.com/';
// 7配置保存session信息 为true 保存seesion
axios.defaults.withCredentials=true
// 8；axios 注册vue
Vue.prototype.axios=axios;
// 3.将mint-ui注册vue实例
Vue.use(MintUI)
// 弹出层
Vue.use(Picker);
Vue.use(Popup);
Vue.use(Field);
Vue.use(Panel);
Vue.use(Button);
Vue.use(Cell).use(CellGroup);
// 时间选择
Vue.use(DatetimePicker);
Vue.config.productionTip = false
// 4.详情页加载时问题
// 页面加载完毕后  把滚动条的距离设置为（0，0） 
router.afterEach((to, from, next) => {
  window.scrollTo(0, 0)
});


/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
