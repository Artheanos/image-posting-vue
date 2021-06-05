// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// require("@rails/ujs").start()
// require("turbolinks").start()
// require("@rails/activestorage").start()
// require("channels")

import Vue from 'vue/dist/vue.esm';
import VueRouter from "vue-router";
import VueMaterial from 'vue-material'
import 'vue-material/dist/vue-material.min.css'
import 'vue-material/dist/theme/default.css'

import Page404 from '../components/common/page-404'
import App from '../components/app'
import ImagePage from '../components/image-page/image-page'
import LoginPage from '../components/user/login-page/login-page';

const router = new VueRouter({
    mode: 'history',
    routes: [
        {path: '/', component: ImagePage, name: 'app'},
        {path: '/login', component: LoginPage, name: 'login'},

        {path: '*', component: Page404, name: 'page'},
        // {path: '*', redirect: '/'}
    ]
});

Vue.use(VueMaterial)
Vue.use(VueRouter)
const app = new Vue({
    router,
}).$mount('#app')

// document.addEventListener('DOMContentLoaded', () => {
//     Vue.use(VueMaterial);
//     const app = new Vue({
//         render: h => h(App)
//     }).$mount()
//     document.body.appendChild(app.$el)
//
//     console.log(app)
// })