import Vue from 'vue'
import Router from 'vue-router'


import Home from '@/components/travel/Home'
import Detail from '@/components/travel/Detail'
import Travel from '@/components/travel/Travel'
import Index from '@/components/travel/Index'
import Goal from '@/components/travel/Goal'
import My from '@/components/travel/My'
import LoginMethods from '@/components/travel/LoginMethods'
import UserReg from '@/components/travel/UserReg'
import MyCart from '@/components/travel/MyCart'
import MyOrder from '@/components/travel/MyOrder'
import OrderList from '@/components/travel/OrderList'
import Order from '@/components/travel/Order'
import LoginDetail from '@/components/travel/LoginDetail'
import Tuijian from '@/components/travel/Tuijian'
import Love from '@/components/travel/Love'
import Pay from '@/components/travel/Pay'
import Successful from '@/components/travel/Successful'
import phoneReg from '@/components/travel/phoneReg'

Vue.use(Router)

export default new Router({
  routes: [
   {path: '/loginDetail',component: LoginDetail},
   {path: '/love',component: Love},
   {path: '/tuijian/:tid/:uid',component: Tuijian,props:true},
   {path: '/Order/:lid/:uid',component: Order,props:true},
   {path: '/orderList',component: OrderList},
    {path: '/myOrder/:val/:i/:uid',component: MyOrder,props:true},
    {path: '/myCart',component: MyCart},
    {path: '/userReg',component: UserReg},
    {path: '/loginMethods',component: LoginMethods},
    {path: '/my',component: My},
    {path: '/goal',component: Goal},
    {path: '/index/:uid',component: Index,props:true},
    {path: '/travel',component: Travel},
    {path: '/Detail/:lid/:uid',component: Detail,props:true},
    {path: '/',component: Home},
    {path: '/home/:uid/:uid1',component: Home,props:true},
    {path: '/Pay/:lid/:uid',component: Pay,props:true},
    {path: '/Successful/:uid',component: Successful,props:true},
    {path: '/phone',component: phoneReg}

  ]
})
